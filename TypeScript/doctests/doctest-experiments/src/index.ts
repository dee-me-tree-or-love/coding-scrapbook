import "dotenv/config";
import logger from "./utils/logger";
import { doctestFastFib } from "./lib/doctest";
import { powerDoctestFastFib } from "./lib/power-doctest";
import { doctestTsImprovedFastFib } from "./lib/d_octest-ts-improved";
import { doctestTsFastFib } from "./lib/d_octest-ts";

const cartesianProduct = (a: any[], b: any[]) =>
  a.reduce((p, x) => [...p, ...b.map((y) => [x, y])], []);

const fibSeeds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const fibOptions = [
  doctestFastFib,
  powerDoctestFastFib,
  doctestTsImprovedFastFib,
  doctestTsFastFib,
];

const tasks: [number, (n: number) => number][] = cartesianProduct(
  fibSeeds,
  fibOptions
);

const runTasks = () =>
  tasks.forEach(([n, fib]) =>
    logger.info(`${n}\tFibonacci number == ${fib(n)}\tusing \`${fib.name}\``)
  );

logger.info(`Hello everyone! ${process.env.EMOJI || "🚀"}`);
logger.info(`Let's compute some Fibonacci numbers 💃`);
runTasks();
