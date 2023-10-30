#include "functions.hpp"  // functions for test
#include "iostream"

int main(int argc, char const *argv[]) {
  /* code */

  std::cout << "App started" << std::endl;

  std::cout << "a=5, b=3" << std::endl;
  std::cout << "a+b=" << sum(5, 3) << std::endl;
  std::cout << "a*b=" << mux(5, 3) << std::endl;
  std::cout << "a/b=" << dev(5, 3) << std::endl;
  return 0;
}
