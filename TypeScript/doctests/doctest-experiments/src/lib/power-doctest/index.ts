import { _fastFib } from "../fastFib";

// powerDoctestFastFib :: number -> number
//
// Calculate n'th fibonacci number
export function powerDoctestFastFib(n: number) {
  return _fastFib(n);
}

// NB: power-doctest acts as comment-based assert statements
powerDoctestFastFib(0); // => 0
powerDoctestFastFib(1); // => 1
powerDoctestFastFib(5); // => 5
powerDoctestFastFib(7); // => 13
