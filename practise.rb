# Даний рядок слів, розділених пробілами. Вивести найдовше слово.
str = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
p str.split(" ").sort_by(&:size).reverse[0]

# Даний рядок, що містить кирилицю, латиницю і цифри. Вивести усі слова, довжина яких рівна середній
str = "Lorem 15 Ipsum є індустрія 3, визначає simply dummy 2  5
text of the printing 5. оголошення 3, and typesetting 2 industry"

str_without_symbols = str.split(/[\W_]+/)
average_length = str_without_symbols.reduce(0) { |acc, word| acc + word.size } / str_without_symbols.length
p str_without_symbols.find_all { |word| word.size == average_length.to_i }

# Знайти в рядку перше цілком кириличне слово
str = "Lorem 15 Ipsum індустрія 3, визначає simply dummy 2  5
text of the printing 5. оголошення 3, and typesetting 2 industry"

p str.match(/[а-яієїА-ЯІЇЄ]{2,}/).to_s

#Даний текст (рядок з перенесеннями). Знайти усі слова, що містять лише три букви "о".
str = "Lorem 15 Ipsum є зоолог індустрія 3, визначає simply dummy 2  5 -
text of the printing 5. оголошення 3,  and typesetting 2 industry
Lorem 15 Ipsum є індустрія 3, колобок визначає simply dummy 2  5 -
text of the printing 5 домофон. оголошення богомол 3, and typesetting 2 industry
Lorem 15 Ipsum є індустрія 3, визначає simply dummy 2  5 -
text of the printing 5. оголошення 3, and typesetting 2 industry
"
p str.split(/[^\w_а-яА-ЯіїєІЇЄ]+/).find_all {|s| s.count("о") == 3 }

# Знайти в тексті час у форматі "години:хвилини:секунди".
str = "Lorem 15 Ipsum є зоолог індустрія 3, визначає simply dummy 2  5 -
text of the printing 5. оголошення 3, 12:53:60  and typesetting 2 industry
Lorem 15 Ipsum є індустрія 3, колобок визначає simply dummy 2  5 -
text of the printing 5 домофон. 12:12:60 оголошення богомол 3, and typesetting 2 industry
Lorem 15 Ipsum є індустрія 3, визначає 60:12:05 simply отто dummy 2  5 -
text of the printing 5. оголошення 3, and typesetting 2 industry
"
p str.scan(/([0-1][0-9]|2[0-4]):([0-5][0-9]|60):([0-5][0-9]|60)/).map { |s| s.join(":") }

# Знайти усі слова без букв що повторюються (наприклад, "Лісп"
# або "Ruby", але не "Паскаль" або "Java"),.не враховуйте цифри в
# словах.
str = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.
Lorem Ip1sum has been the industry's standard dummy te3xt ev3er since the 1500s,
when an unkn2own printer took a galley of type an2d scrambled it to make a type specimen book."

result = str.split(/[\W_]+/).reduce(Hash.new { [] }) { |res, s|
  new_str = s.gsub(/[0-9]+/, "")

  if res.key?(new_str.length)
    res[:new_str.length] = [s]
  else
    map_by_key = res[new_str.length.to_s]
    map_by_key.push(s)
    res[new_str.length.to_s] = map_by_key
  end
  res
}

result.each { |key, map| p key, map.to_a }

#  Знайти в тексті слова, що містять дві прописні букви і виправити.
str = "LOrem 15 IPsum є text of the printing 5. оголошення 3, and TYpesetting 2 industry LOrem"

patter = /[A-ZА-ЯІЇЄ]{2}[a-zа-яєїі]*/
words = str.scan(patter)
words.each { |word| str = str.gsub(word, word.capitalize) }
p str

# Знайти в тексті дати формату "день.місяць.рік".
str = "LOrem 15 IPsum є зоолог індустрія 3, визначає simply dummy 2  5 -
text of the printing 5. оголошення 3, 30.05.2022  and typesetting 2 industry
LOrem 15 Ipsum є індустрія 3, колобок визначає simply dummy 2  5 -
text of the printing 5 домофон. 14.05.2022 оголошення богомол 3, and typesetting 2 industry
LOrem 15 IPsum є індустрія 3, визначає 19.12.2022 simply отто dummy 2  5 -
text of the printing 5. оголошення 3, and typesetting 2 industry
"

p str.scan(/(0[1-9]|[12][0-9]|3[01]).(0[1-9]|1[012]).([10-20]\d{3})/).map { |s| s.join(".") }

# Знайдіть дату, де день обмежений числом 31, а місяць 12. Рік обмежуйте чотиризначними числами.
str = "LOrem 15 IPsum є зоолог індустрія 3, визначає simply dummy 2  5 -
text of the printing 5. оголошення 3, 31.12.2020  and typesetting 2 industry
LOrem 15 Ipsum є індустрія 3, колобок визначає simply dummy 2  5 -
text of the printing 5 домофон. 31.12.1999 оголошення богомол 3, and typesetting 2 industry
LOrem 15 IPsum є індустрія 3, визначає 31.12.2022 simply отто dummy 2  5 -
text of the printing 5. оголошення 3, and typesetting 2 industry
"

p str.scan(/31.12.[1-2][0-9][0-9][0-9]/)

# Дано текст. Знайдіть усі URL адреси і виділіть з них тільки кореневий домен (наприклад, з
# https://en.wikibooks.org/wiki/Ruby_Programming зробіть
# https://en.wikibooks.org).
str = "LOrem 15 IPsum є зоолог https://test.com/Ruby_Programming 3, визначає simply dummy 2  5 -
text of the printing 5. оголошення 3, 31.12.2020  and typesetting 2 industry
LOrem 15 Ipsum є індустрія https://en.wikibooks.org/wiki/Ruby_Programming, колобок визначає simply dummy 2  5 -
text of the printing 5 домофон. 31.12.1999 оголошення богомол 3, and typesetting 2 industry
LOrem 15 IPsum є індустрія https://google.com.ua/Ruby_Programming, визначає 31.12.2022 simply отто dummy 2  5 -
text of the printing 5. оголошення 3, and typesetting 2 industry
"

p str.scan(/https:\/\/[\w_.]+/)
