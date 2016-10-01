## Load the data
topics <- read.table("./data/topics.txt", header = TRUE, sep = ";",
                     stringsAsFactors = FALSE)
papers <- read.table("./data/papers.txt", header = TRUE, sep = ";",
                     stringsAsFactors = FALSE)

cat(paste0(rep("@@", 40), collapse = ""), sep = "\n")
str(topics)

cat(paste0(rep("@@", 40), collapse = ""), sep = "\n")
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

cat(paste0(rep("@@", 40), collapse = ""), sep = "\n")
abstracts <- with(papers, split(abstract, topic))

cat(paste0(rep("@@", 40), collapse = ""), sep = "\n")
str(abstracts)

cat(paste0(rep("@@", 40), collapse = ""), sep = "\n")
str(abstracts[[1]])

cat(paste0(rep("@@", 40), collapse = ""), sep = "\n")
text <- abstracts[[1]]
textdoc <- Corpus(VectorSource(text))
textdoc %>%
    tm_map(removeWords, stopwords("english")) %>%
    tm_map(removePunctuation) %>%
    tm_map(stripWhitespace) %>%
    tm_map(removeNumbers) %>%
    tm_map(stemDocument)

## ma <- text2matrix(abstracts[[1]])
## str(ma)
