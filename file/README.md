# FTL test assignment

## Description
Write a ruby script that:
* accepts url to github repository as a command line argument
* grabs `README.md` file from this repository
* checks if `README.md` has any multiline code blocks without syntax highlighting
* automatically determines programming language for those code blocks
* generates new version of `README.md` with syntax highlighting added
* **bonus task**: creates a pull request with new version of markdown file and outputs URL to that pull request to STDOUT

You can read more about code blocks and syntax highlighting in github's markdown files [here](https://help.github.com/articles/creating-and-highlighting-code-blocks/)

## Expected result
send a link to public github repository with executable ruby script to skype *ivan.denysov*

## Sample code blocks

### Ruby
```ruby
1.upto(100) do |n|
  print "Fizz" if a = (n % 3).zero?
  print "Buzz" if b = (n % 5).zero?
  print n unless (a || b)
  puts
end
```

### PHP
```php
<?php
for ($i = 1; $i <= 100; $i++)
{
    if (!($i % 15))
        echo "FizzBuzz\n";
    else if (!($i % 3))
        echo "Fizz\n";
    else if (!($i % 5))
        echo "Buzz\n";
    else
        echo "$i\n";
}
?>
```

### PERL
```perl
print 'Fizz'x!($_ % 3) . 'Buzz'x!($_ % 5) || $_, "\n" for 1 .. 100;
```

### Python
```python
for i in xrange(1, 101):
    if i % 15 == 0:
        print "FizzBuzz"
    elif i % 3 == 0:
        print "Fizz"
    elif i % 5 == 0:
        print "Buzz"
    else:
        print i
```
### Java
```javascript
var fizzBuzz = function () {
  var i, output;
  for (i = 1; i < 101; i += 1) {
    output = '';
    if (!(i % 3)) { output += 'Fizz'; }
    if (!(i % 5)) { output += 'Buzz'; }
    console.log(output || i);//empty string is false, so we short-circuit
  }
};
```

### C#
```c#
class Program
{
    static void Main()
    {
        for (uint i = 1; i <= 100; i++) {
            string s = null;

            if (i % 3 == 0)
                s = "Fizz";

            if (i % 5 == 0)
                s += "Buzz";

            System.Console.WriteLine(s ?? i.ToString());
        }
    }
}
```
