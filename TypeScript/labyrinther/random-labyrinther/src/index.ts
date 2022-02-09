import { generateRandomLabyrinth } from "./core/generator";

export const main = (): string => {
    const labyrinth = generateRandomLabyrinth(5, 5);
    console.log(labyrinth);
    return 'Hello world!';
};

main();