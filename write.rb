file = File.open('people.json', 'a+')
# file.write("[{
#   \"age\": 21,
#   \"name\": \"John\"
#   },]")

puts file.readline('},]')

file.write(", {
  \"age\": 23,
  \"name\": \"Red\"
}]")

# read = File.open("people.json", "r");
# file.read
