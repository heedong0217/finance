BCcard <- read.csv("c:/data/금융빅데이터공모전_데이터/비씨카드.csv", header = T)

BC_kind_count<-tapply(BCcard$건수,list(BCcard$업종명,BCcard$매출년월),sum)

barplot(BC_kind_count,names.arg=colnames(BC_kind_count),
        main="년월별 업종 판매건수",xlab='년월',ylab='건수',
        legend.text=rownames(BC_kind_count),
        beside=T)
