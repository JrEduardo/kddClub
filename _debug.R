## Load the data
topics <- read.table("./data/topics.txt", header = TRUE, sep = ";",
                     stringsAsFactors = FALSE)
papers <- read.table("./data/papers.txt", header = TRUE, sep = ";",
                     stringsAsFactors = FALSE)

str(topics)
str(papers)
