library(ggplot2)
library(NLP)
library(tm)
library(RWeka)
library(data.table)
library(dplyr)
#Note: I had some problems with RWeka as it has some dependencies with Rjava. Please, be sure you have JDK 1.8 installed (or higher). 
## I have really wasted a lot of time dealing with JDK 1.7 setting JAVA_HOME and some other dependencies.
## Nice post to set JAVA_HOME in MACos to latest installed Java version here: http://www.appsdeveloperblog.com/how-to-set-java_home-on-mac/

blogs_file   <- "Coursera X - Final Capstone/final/en_US/en_US.blogs.txt"
news_file    <- "Coursera X - Final Capstone/final/en_US/en_US.news.txt"
twitter_file <- "Coursera X - Final Capstone/final/en_US/en_US.twitter.txt" 

blog <- readLines(blogs_file,skipNul = TRUE, warn = TRUE)
news <- readLines(news_file,skipNul = TRUE, warn = TRUE)
twitter <- readLines(twitter_file,skipNul = TRUE, warn = TRUE)

#As we saw in Tasks 1 and 2, files are huge, so we'd better work with a sample of the data.
set.seed(1414)
sample_size = 1500

sample_blog <- blog[sample(1:length(blog),sample_size)]
sample_news <- news[sample(1:length(news),sample_size)]
sample_twitter <- twitter[sample(1:length(twitter),sample_size)]

sample_data<-rbind(sample_blog,sample_news,sample_twitter)
#Let's free some RAM
rm(blog,news,twitter)

#Let's join all data samples to create corpus object needed for tm functions.
## Interesting link to learn basic use of tm functions
##https://rstudio-pubs-static.s3.amazonaws.com/265713_cbef910aee7642dc8b62996e38d2825d.html
corpus_sample<-VCorpus(VectorSource(sample_data))
corpus_sample <- tm_map(corpus_sample, content_transformer(tolower)) # convert to lowercase
corpus_sample <- tm_map(corpus_sample, removePunctuation) # remove punctuation
corpus_sample <- tm_map(corpus_sample, removeNumbers) # remove numbers
corpus_sample <- tm_map(corpus_sample, stripWhitespace) # remove multiple whitespace

#remove special chars not supported by tm functions
removeSpecialChars <- function(x) gsub("[^a-zA-Z0-9 ]","",x)
corpus_sample <- tm_map(corpus_sample, content_transformer(removeSpecialChars))

## After seeing the range of words that "stopwords" delete, I decided not to use it.
# stopwords("english")   
#corpus_sample <- tm_map(corpus_sample, removeWords, stopwords("english"))   
#corpus_sample <- tm_map(corpus_sample, PlainTextDocument)

##Another cleaning could be cleaning typlical english finishing words
#This is referred to as “stemming” documents. We stem the documents so that a word will be recognizable to the computer, 
#despite whether or not it may have a variety of possible endings in the original text.
#corpus_sample_st <- tm_map(corpus_sample, stemDocument)   
#corpus_sample_st <- tm_map(corpus_sample_st, PlainTextDocument)

#Time to build the n-grams. I am using "RWeka" pachage. It is working similar to StringTokenzer in Java
uniGramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 1, max = 1))
biGramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))
triGramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 3, max = 3))
fourGramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 4, max = 4))
fiveGramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 5, max = 5))

OneT <- NGramTokenizer(corpus_sample, Weka_control(min = 1, max = 1))
oneGM <- TermDocumentMatrix(corpus_sample, control = list(tokenize = uniGramTokenizer))
twoGM <- TermDocumentMatrix(corpus_sample, control = list(tokenize = biGramTokenizer))
threeGM <- TermDocumentMatrix(corpus_sample, control = list(tokenize = triGramTokenizer))
fourGM <- TermDocumentMatrix(corpus_sample, control = list(tokenize = fourGramTokenizer))
fiveGM <- TermDocumentMatrix(corpus_sample, control = list(tokenize = fiveGramTokenizer))

## 1 Word NGrams
freqTerms1 <- findFreqTerms(oneGM, lowfreq = 5)
termFreq1 <- rowSums(as.matrix(oneGM[freqTerms1,]))
termFreq1 <- data.frame(unigram=names(termFreq1), frequency=termFreq1)
termFreq1 <- termFreq1[order(-termFreq1$frequency),]
unigramlist <- setDT(termFreq1)
save(oneGM,unigramlist,file="Coursera X - Final Capstone/App/FinalCapstone/rds/unigram.Rda")

#Plot
plotUnigrams <- ggplot(data = head(unigramlist,10), aes(x = reorder(unigram, -frequency), y = frequency)) + 
  geom_bar(stat = "identity", fill = "green") + 
  ggtitle(paste("Unigrams")) + 
  xlab("Unigrams") + ylab("Frequency") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("Coursera X - Final Capstone/plots/Unigrams.png")

#Let's free some RAM
rm(OneT,freqTerms1,termFreq1,unigramlist)

## 2 Word NGrams
freqTerms2 <- findFreqTerms(twoGM, lowfreq = 3)
termFreq2 <- rowSums(as.matrix(twoGM[freqTerms2,]))
termFreq2 <- data.frame(bigram=names(termFreq2), frequency=termFreq2)
termFreq2 <- termFreq2[order(-termFreq2$frequency),]
bigramlist <- setDT(termFreq2)
save(bigramlist,file="Coursera X - Final Capstone/App/FinalCapstone/rds/bigram.Rda")

plotBigrams <- ggplot(data = head(bigramlist,10), aes(x = reorder(bigram, -frequency), y = frequency)) + 
  geom_bar(stat = "identity", fill = "orange") + 
  ggtitle(paste("Bigrams")) + 
  xlab("Bigrams") + ylab("Frequency") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("Coursera X - Final Capstone/plots/Bigrams.png")

rm(twoGM,freqTerms2,termFreq2,bigramlist)

## 3 Word NGrams
freqTerms3 <- findFreqTerms(threeGM, lowfreq = 2)
termFreq3 <- rowSums(as.matrix(threeGM[freqTerms3,]))
termFreq3 <- data.frame(trigram=names(termFreq3), frequency=termFreq3)
trigramlist <- setDT(termFreq3)
save(trigramlist,file="Coursera X - Final Capstone/App/FinalCapstone/rds/trigram.Rda")

plotTrigrams <- ggplot(data = head(trigramlist,10), aes(x = reorder(trigram, -frequency), y = frequency)) + 
  geom_bar(stat = "identity", fill = "red") + 
  ggtitle(paste("Trigrams")) + 
  xlab("Trigrams") + ylab("Frequency") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("Coursera X - Final Capstone/plots/Trigrams.png")

rm(threeGM,freqTerms3,termFreq3,trigramlist)

## 4 Word NGrams
freqTerms4 <- findFreqTerms(fourGM, lowfreq = 1)
termFreq4 <- rowSums(as.matrix(fourGM[freqTerms4,]))
termFreq4 <- data.frame(fourgram=names(termFreq4), frequency=termFreq4)
fourgramlist <- setDT(termFreq4)
save(fourgramlist,file="Coursera X - Final Capstone/App/FinalCapstone/rds/fourgram.Rda")

plotFourgrams <- ggplot(data = head(fourgramlist,10), aes(x = reorder(fourgram, -frequency), y = frequency)) + 
  geom_bar(stat = "identity", fill = "red") + 
  ggtitle(paste("Fourgrams")) + 
  xlab("Fourgrams") + ylab("Frequency") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("Coursera X - Final Capstone/plots/Fourgrams.png")

rm(fourGM,freqTerms4,termFreq4,fourgramlist)

## 5 Word NGrams
freqTerms5 <- findFreqTerms(fiveGM, lowfreq = 1)
termFreq5 <- rowSums(as.matrix(fiveGM[freqTerms5,]))
termFreq5 <- data.frame(fivegram=names(termFreq5), frequency=termFreq5)
fivegramlist <- setDT(termFreq5)
save(fivegramlist,file="Coursera X - Final Capstone/App/FinalCapstone/rds/fivegram.Rda")


plotFivegrams <- ggplot(data = head(fivegramlist,5), aes(x = reorder(fivegram, -frequency), y = frequency)) + 
  geom_bar(stat = "identity", fill = "red") + 
  ggtitle(paste("Fivegrams")) + 
  xlab("Fivegrams") + ylab("Frequency") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("Coursera X - Final Capstone/plots/Fivegrams.png")

#Let's free some RAM
rm(fiveGM,freqTerms5,termFreq5,fivegramlist)
