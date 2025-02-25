from maze_maker.makers import make_slashes, MazeParameters


def main():
    base_params = MazeParameters(100, 10)
    print(make_slashes(base_params))


if __name__ == "__main__":
    main()
