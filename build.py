import subprocess
import os
import time

RESUME = []

typst = "typst"
compile = "c"
features = "--features html"
query = "query"
target = "--target html"
root = "--root ."
field = "--field value"


def todo_label(s):
    return f' "<todo-{s}>" '


entry_point = "index.typ"


def input(name, value):
    return f"--input {name}={value} --input html-frames=true"


def lang(file):
    lang_name = "fr"
    return input("lang", lang_name)


def execute(s: str, to_print=None) -> str:
    if to_print == None:
        print(">>> ", s)
    else:
        print(">>> ", to_print)

    return subprocess.check_output(s, shell=True).decode("utf-8")


class Typst:
    def compile(self, src, extension):
        dest = " docs/" + src[: len(src) - len(".typ")] + f".{extension} "
        dir = "/".join(dest.split("/")[:-1])
        if not os.path.isdir(dir):
            execute(f"mkdir -p {dir}")
        execute(
            " ".join(
                [
                    typst,
                    compile,
                    features,
                    root,
                    src,
                    dest,
                    input("path", src),
                    input("in_query", "false"),
                ]
            )
        )

    def query_outside_link(self, file, type_file):
        command = " ".join(
            [
                typst,
                query,
                features,
                root,
                target,
                file,
                todo_label(type_file),
                field,
                input("path", file),
                input("in_query", "true"),
            ]
        )
        raw_output = execute(command).strip()
        output = list(map(lambda s: s[1:-1], raw_output[1:-1].split(",")))
        return output


init_time = time.time()

todo = {"html": [entry_point], "pdf": []}
done = []
t = Typst()
execute("rm -rf docs/*")


def not_treated(file, todo, done):
    return (file not in done) and (file not in todo) and (file != "")


def timer():
    pass


while todo["html"] != []:
    file = todo["html"].pop()
    done.append(file)

    if not os.path.exists(file):
        continue

    type = "html"
    links = t.query_outside_link(file, type)
    for link in links:
        if not_treated(link, todo[type], done):
            RESUME.append(f'{type.upper()}-> "{link}"')
            todo[type].append(link)

    type = "pdf"
    links = t.query_outside_link(file, type)
    for link in links:
        if link.strip() != "":
            RESUME.append(f'{type.upper()}-> "{link}"')
            t.compile(link, type)
            done.append("/".join(link.split(".")[:-1]) + f".{type}")

    t.compile(file, "html")
    RESUME.append(f'\nCOMPILE : "{file}"')

print(">>> RESUME :")
for line in RESUME:
    print(line)


print(f">>> {len(done)} files have been compiled in {time.time() - init_time:.1f}s :")

i = 0
for file in done:
    i += 1
    print(f"{i} -  - {file}")
