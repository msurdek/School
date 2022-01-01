textfile = input("Let's count the sentences and the words in your file!\nEnter filename: ")

readfile = open(textfile,"r")

lines = readfile.read()

readfile.close()

sentences = lines.count(".") + lines.count("!") + lines.count("?")

print("There are %d sentences in %s." % (sentences, textfile))

words = lines.split()

wordcount = len(words)

print("There are %d words in %s." % (wordcount, textfile))