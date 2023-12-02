# Notes - Day 1 - Trebuchet?!
## Part 1
Part 1 was easy, just a regex for identifying the digits.
## Part 2
Part 2 was tricky because in the regex I didn't consider the case where two numbers
are represented by overlapping words (e.g. `oneeight`).

So the sum was higher than expected.

I was able to solve it only after changing the regex. 

Later on, I thought that the `HASH` is not really necessary because I could have taken the correspondent integer value
for example from an arry index, instead of defining key-value pairs.
