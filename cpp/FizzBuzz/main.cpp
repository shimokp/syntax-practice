#include <iostream>

int main() {
  for (int i = 1; i <= 30; i++) {
    std::string output;

    if (i % (3 * 5) == 0)
      output = "FizzBuzz";
    else if (i % 3 == 0)
      output = "Fizz";
    else if (i % 5 == 0)
      output = "Buzz";
    else
      output = std::to_string(i);

    std::cout << output << std::endl;
  }

  return 0;
}
