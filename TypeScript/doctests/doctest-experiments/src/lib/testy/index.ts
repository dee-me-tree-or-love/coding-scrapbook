import { _fastFib } from "../fastFib";

/**
 * Compute the n'th Fibonacci number
 * @param n required order
 * @returns computed number
 * @example testyFastFib(0)
 * //=> 0
 * @example testyFastFib(1)
 * //=> 1
 * @example testyFastFib(5)
 * //=> 5
 * @example testyFastFib(7)
 * //=> 13
 */
export function testyFastFib(n: number): number {
  return _fastFib(n);
}
