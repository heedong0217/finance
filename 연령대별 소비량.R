
data <- read.csv("c:/data/금융빅데이터공모전_데이터/비씨카드.csv", header = T)
data

str(data)
class(data)
typeof(data)
NROW(data)

data$연령대
table(data$연령대)


# 남자 연령대별 소비량 
men <-data[data$성별 == "남", ]
tapply(men$건수, list(men$연령대), sum)

10대      20대      30대      40대      50대 60대 이상   unmatch 
83121   3103243   4114360   2861882   1950269   1227146         7 

m1 <- tapply(men$금액, list(men$연령대), sum)

10대        20대        30대        40대        50대   60대 이상     unmatch 
500917790 29216288970 47844012190 38051842347 31491501242 25358550085      158700 


class(m1) # array 



# 여자 연령대별 소비량 
women <- data[data$성별 == "여", ]
tapply(women$건수, list(women$연령대), sum)

10대      20대      30대      40대      50대 60대 이상   unmatch 
121895   4477188   3713545   2232534   1452231    757426         6

w1 <- tapply(women$금액, list(women$연령대), sum)

10대        20대        30대        40대        50대   60대 이상     unmatch 
759055497 40510234131 39909924906 27337214116 20432281612 13253302683       66420 



df <-  cbind(m1, w1)
df2 <- t(df)

rownames(df2)
max(df2)
min(df2)
df2
df2[1,]
df2[,]


bp <- barplot(df2, names.arg = colnames(df2), main = "연령대별 소비량",
        xlab = "연령", ylab = "소비량", ylim = c(min(df2), max(df2)),
        beside = T,
        col = c("red","blue"),
        legend.text = c("남자", "여자"))
bp
