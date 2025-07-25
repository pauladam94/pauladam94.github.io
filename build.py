import os

typst = " typst "
compile = " c --features html "
query = " query "
format = " --format html "
entry_point = "src/index.typ"
todo = [entry_point]


def execute(s : str):
    print(s)
    os.system(s)

class Typst:
    def __init__(self):
        pass

    def c(self, file):
        self.compile(file)

    def compile(self, src):
        dest = " docs/" + src[len("src/"):len(src) - len(".typ")] + ".html "
        execute(typst + compile + " --root . " + format + src + dest)

t = Typst()

while todo != []:
    file = todo.pop()
    t.compile(file)

