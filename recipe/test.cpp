#include <cmath>

#include <muParser.h>

int main() {
  double x = 3.0;
  mu::Parser parser;
  parser.DefineVar("x", &x);
  parser.SetExpr("x^2 + 1");
  return std::abs(parser.Eval() - 10.0) < 1e-12 ? 0 : 1;
}
