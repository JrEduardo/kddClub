## Load the data
topics <- read.table("./data/topics.txt", header = TRUE, sep = ";",
                     stringsAsFactors = FALSE)
papers <- read.table("./data/papers.txt", header = TRUE, sep = ";",
                     stringsAsFactors = FALSE)

str(topics)
str(papers)

library(tm)
library(rvest)

higienize <- function(doc) {
    doc %>%
        tm_map(removeWords, stopwords("english")) %>%
        tm_map(removePunctuation) %>%
        tm_map(stripWhitespace) %>%
        tm_map(removeNumbers) %>%
        tm_map(stemDocument)
}
text2matrix <- function(text) {
    ## Create Corpus
    textdoc <- Corpus(VectorSource(text))
    textdoc <- higienize(textdoc)
    ## Document Term Matrix
    textdtm <- DocumentTermMatrix(textdoc)
    as.matrix(textdtm)
}

abstracts <- with(papers, split(abstract, topic))

str(abstracts)
str(abstracts[[1]])

ma <- text2matrix(abstracts[[1]])
str(ma)
