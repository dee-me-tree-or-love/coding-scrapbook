import { _fastFib } from "../fastFib";

// doctestFastFib :: number -> number
//
// Calculate n'th fibonacci number
//
// > doctestFastFib(0)
// 0
// > doctestFastFib(1)
// 1
// > doctestFastFib(5)
// 5
// > doctestFastFib(7)
// 13
export function doctestFastFib(n: number) {
  return _fastFib(n);
}
