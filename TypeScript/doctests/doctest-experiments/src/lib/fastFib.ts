const phiCoefficient = Math.sqrt(5);
const phi = (1 + phiCoefficient) / 2;

export function _fastFib(n: number) {
  const asymp = Math.pow(phi, n) / phiCoefficient;
  return Math.round(asymp);
}
