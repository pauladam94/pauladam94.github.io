import subprocess
import os
import time

RESUME = []

typst = " typst "
compile = " c "
features = " --features html"
query = " query "
target = "--target html "
root = " --root . "
field = " --field value "


def todo_label(s):
    return f' "<todo-{s}>" '


entry_point = "src/index.typ"


def input(name, value):
    return f"--input {name}={value} "


def lang(file):
    lang_name = "fr"
    return input("lang", lang_name)


def execute(s: str) -> str:
    print(">>> ", s)
    return subprocess.check_output(s, shell=True).decode("utf-8")


class Typst:
    def compile(self, src, extension):
        dest = " docs/" + src[len("src/") : len(src) - len(".typ")] + f".{extension} "
        dir = "/".join(dest.split("/")[:-1])
        if not os.path.isdir(dir):
            execute(f"mkdir -p {dir}")
        execute(typst + compile + features + root + src + dest + input("path", src))

    def query_outside_link(self, file, type_file):
        command = (
            typst
            + query
            + features
            + root
            + target
            + file
            + todo_label(type_file)
            + field
            + input("path", file)
        )
        raw_output = execute(command).strip()
        output = list(map(lambda s: s[1:-1], raw_output[1:-1].split(",")))
        return output


init_time = time.time()

todo_html = [entry_point]
todo_pdf = []
done = []
t = Typst()
execute("rm -rf docs/*")


def not_treated(file, todo, done):
    return (file not in done) and (file not in todo) and (file != "")


while todo_html != []:
    file = todo_html.pop()
    done.append(file)

    if not os.path.exists(file):
        continue

    t.compile(file, "html")
    RESUME.append(f"\nCOMPILE : \"{file}\"")

    links = t.query_outside_link(file, "html")
    for link in links:
        if not_treated(link, todo_html, done):
            RESUME.append(f"HTML-> \"{link}\"")
            todo_html.append(link)

    links = t.query_outside_link(file, "pdf")
    for link in links:
        if link.strip() != "":
            RESUME.append(f"PDF-> \"{link}\"")
            todo_pdf.append(link)

print(">>> RESUME :")
for line in RESUME:
    print(line)

for file in todo_pdf:
    t.compile(file, "pdf")


print(f">>> {len(done)} files have been compiled in {time.time() - init_time:.1f}s :")
for file in done:
    print(f"\t- {file}")
