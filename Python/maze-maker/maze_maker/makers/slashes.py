from maze_maker.makers.models import MazeParameters
from random import randint


def __random_slash() -> str:
    return "\\" if randint(0, 1) else "/"


def make_slashes(params: MazeParameters) -> str:
    return "\n".join(
        [
            "".join([__random_slash() for _ in range(params.width)])
            for _ in range(params.heigth)
        ]
    )
