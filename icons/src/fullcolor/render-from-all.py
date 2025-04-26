#!/usr/bin/python3
import argparse
import os
import subprocess
import sys
from pathlib import Path

CURRENT_PATH = os.path.dirname(os.path.abspath(__file__))
SIZES = (256,48,32,24,16)

def init_parser() -> argparse:
    parser = argparse.ArgumentParser(description='Render your icons to respective sizes')

    def validate_context(context: str):
        allowed = ['apps']
        if context == "":
            raise argparse.ArgumentTypeError("render-from-all.py: error: argument --name: expected one argument")
        return context

    parser.add_argument('--name', type=str, help="The Icon Name")
    parser.add_argument('--context', type=validate_context, default='apps', help='args such as apps, status etc.')

    return parser.parse_args()



class GenerateIcons:
    def __init__(self, name, context):
        self.__name=name
        self.__context=context
        self.__success = self.__generate
    def success(self) -> bool:
        return self.__success
    
    def __generate(self) -> list:
        name = self.__name
        context = self.__context
        svg_src = f"{CURRENT_PATH}/all/{name}.svg"
        file = Path(svg_src)
        if not file.is_file():
            raise argparse.ArgumentTypeError("render-from-all.py: error: icon svg file not found.")

        success = True
        for size in SIZES:
            for i in [0, 1]:
                output = f"{CURRENT_PATH}/../../YaruX/{context}/{size}{i*"@2x"}/{name}.png"
                target = f"rect{size}x{size}" if size <= 48 else "rect3951"
                inkscape_cmd = f"inkscape --batch-process --export-dpi={96*(i+1)} --export-filename={output} -i {target} {svg_src}"
                print(f" [-] exporting {target} scale={i+1} context={context}", end="\r")
                res = subprocess.run(inkscape_cmd, capture_output=True,  shell=True)
                if res.returncode != 0:
                    print(f" [\033[31m×\033[0m] exporting {target} scale={i+1} context={context}")
                    self.success = False
                else:
                    print(f" [\033[32m✓\033[0m] exporting {target} scale={i+1} context={context}")
        return success
  

def main():
    parser = init_parser()
    icons = GenerateIcons(parser.name, parser.context)
    if not icons.success():
        print(" \033[31m! not all icons targets were exported\033[0m")


if __name__ == '__main__':
    sys.exit(main())
