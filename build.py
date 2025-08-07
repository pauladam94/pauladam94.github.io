import subprocess
import json
import os

typst = " typst "
compile = " c "
features = " --features html"
query = " query "
format = " -f html "
target = "--target html "
root = " --root . "
field = " --field value "
todo_label = " \"<todo>\" "
entry_point = "src/index.typ"

def input_path(path) :
    return f"--input path={path} "


def execute(s : str) -> str:
    print(">>> ", s)
    return subprocess.check_output(s, shell=True).decode("utf-8")

class Typst:
    def __init__(self):
        pass

    def c(self, file):
        self.compile(file)

    def compile(self, src):
        dest = " docs/" + src[len("src/"):len(src) - len(".typ")] + ".html "
        dir = "/".join(dest.split("/")[:-1])
        if not os.path.isdir(dir):
            execute(f"mkdir -p {dir}")
        execute(typst + compile + features + root + format + src + dest + input_path(src))

    def query_outside_link(self, file):
        command = typst + query + features + root + target + file + todo_label + field + input_path(file)
        raw_output = execute(command).strip()
        output = list(map(lambda s : s[1:-1], raw_output[1:-1].split(",")))
        # print("- output = ", output)
        return output

todo = [entry_point]
done = []
t = Typst()
execute("rm -rf docs/*")

while todo != []:
    file = todo.pop()
    done.append(file)
    # print("- file = ", file)

    t.compile(file)
    links = t.query_outside_link(file)
    for link in links:
        if link not in done and link not in todo and link != "":
            todo.append(link)


print(">>> Those files have been compiled :")
for file in done:
    print(f"\t- {file}")
