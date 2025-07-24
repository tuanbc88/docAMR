from transition_amr_parser.parse import AMRParser

# Download and save the docamr model to cache
parser = AMRParser.from_pretrained('doc-sen-conll-amr-seed42')

# Sentences in the doc
doc = ["Hailey likes to travel." ,"She is going to London tomorrow.", "She will walk to Big Ben when she goes to London."]

# tokenize sentences if not already tokenized
tok_sentences = []
for sen in doc:
    tokens, positions = parser.tokenize(sen)
    tok_sentences.append(tokens)

# parse docs takes a list of docs as input
annotations, machines = parser.parse_docs([tok_sentences])

# Print Penman notation
print(annotations[0])

# Print Penman notation without JAMR, with ISI
amr = machines[0].get_amr()
print(amr.to_penman(jamr=False, isi=True))

# Plot the graph (requires matplotlib)
amr.plot()
