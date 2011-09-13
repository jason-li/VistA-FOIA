ABSVTPR ;VAMC ALTOONA/CTB_CLH - MISC REPORT PROGRAM ;4/22/99  3:11 PM
V ;;4.0;VOLUNTARY TIMEKEEPING;**3,6,7,10,15**;JULY 6, 1994
OUT K %DT,%,%X,B,ABSVX("CREATE"),ABSVX("BDATE"),ABSVX("EDATE"),BDATE,COMB,DA,DA1,DDH,DIC,DIE,DIJ,DIK,DP,DQ,DR,DUOUT,EDATE,MONTH,NN,NAME,ORG,SER,VOL,TC,TC1,TC2,TC3,VOLDA,X,X1,XZ,Y,ZI
 Q
DAREVIEW ;REVIEW THE DAILY LIST FOR A SINGLE VOLUNTEER FOR A RANGE OF DATES
 D ^ABSVSITE Q:'%
 S DIC("A")="Select VOLUNTEER NAME: "
DARE1 S DIC=503330,DIC(0)="AMENQ",DIC("S")="I $D(^ABS(503330,+Y,4,ABSV(""INST""),0))"
 D MDIV^ABSVSITE,^DIC G OUT:Y<0
 S DA=+Y,VOLDA=+Y I $P(^ABS(503330,DA,4,ABSV("INST"),0),"^",8)]"" S X="<Volunteer has been terminated>*" D MSG^ABSVQ
 I '$D(^ABS(503331,"B",DA)) W !,"NO ENTRIES IN FILE FOR THIS VOLUNTEER",*7 G OUT
 D RANGE^ABSVTPR1 G:Y<0 OUT
 S ZTDESC="DAILY LIST FOR SINGLE VOLUNTEER",ZTRTN="DV^ABSVTPR",ZTSAVE("VOLDA")="",ZTSAVE("ABSV(""SITE"")")="",ZTSAVE("BDATE")="",ZTSAVE("EDATE")="" D ^ABSVQ,OUT
 S DIC("A")="Select Another VOLUNTEER NAME: " G DARE1
DV ;
 I '$D(ZTQUEUED) D WAIT^ABSVYN
 K ^TMP("ABSVVIEW",$J)
 S IOP=ABIOP I '$D(ZTQUEUED),'$D(IO("S")) D WAIT^ABSVYN
 S N=0 F I=1:1 S N=$O(^ABS(503331,"B",VOLDA,N)) Q:'N  I $D(^ABS(503331,N,0)) S X=^ABS(503331,N,0) I $P(X,"^",7)=ABSV("SITE"),$P(X,"^",3)'<BDATE,$P(X,"^",3)'>EDATE S ^TMP("ABSVVIEW",$J,N)=""
 S L=0,DIC="^ABS(503331,",FR="",TO="",BY=".01,2",FLDS="[ABSV REVIEW DAILY ENTRIES]",BY(0)="^TMP(""ABSVVIEW"",$J,",L(0)=1
 D EN1^DIP
 K ^TMP("ABSVVIEW",$J)
 I $D(ZTQUEUED) D KILL^%ZTLOAD
 G OUT Q
ORGLIST ;PRINT DETAIL VOLUNTEER HOURS BY ORGANIZATION FROM FILE 503335
 N B,DINS,Y,DATE
 D ^ABSVSITE Q:'%
 S %DT="AE",%DT("A")="Select MONTH/YEAR: " D ^%DT K %DT Q:Y<0
 S DATE=$E(Y,1,5)_"00"
 S L=0,DIC="^ABS(503335,",FR=DATE,TO=DATE,(BY,FLDS)="[ABSV ORGANIZATION DETAIL LIST]",DIS(0)="I $P($G(^ABS(503335,D0,0)),U,12)=ABSV(""SITE"")"
 I $D(ABSV("CONDENSED")) S FLDS="[ABSV ORGANIZATION CONDENSED]"
 D EN1^DIP,DIKILL^ABSVQ Q
SERVLIST ;PRINT DETAIL VOLUNTEER HOURS BY SERVICE FROM FILE 503335
 D ^ABSVSITE Q:'%
 S L=0,DIC="^ABS(503335,",(FR,TO)="?",DIS(0)="I $P($G(^ABS(503335,D0,0)),U,12)=ABSV(""SITE"")",(BY,FLDS)="[ABSV SERVICE LIST]" D EN1^DIP,DIKILL^ABSVQ,OUT
 QUIT
OLIST ;PRINT SUMMARY ORG REPORT
 D ^ABSVSITE Q:'%
 S L=0,DIC="^ABS(503335,",(FR,TO)="?",DIS(0)="I $P($G(^ABS(503335,D0,0)),U,12)=ABSV(""SITE"")",(BY,FLDS)="[ABSV ORGANIZATION SUMMARY]" D EN1^DIP,DIKILL^ABSVQ Q
SLIST ;PRINT SUMMARY SERVICE REPORT
 D ^ABSVSITE Q:'%
 S L=0,DIC="^ABS(503335,",(FR,TO)="?",DIS(0)="I $P($G(^ABS(503335,D0,0)),U,12)=ABSV(""SITE"")",(BY,FLDS)="[ABSV SERVICE SUMMARY]" D EN1^DIP,DIKILL^ABSVQ,OUT
 QUIT
WEEKLY ;PRINT WEEKLY TIME SUMMARY REPORT
 D ^ABSVSITE Q:'%
 S L=0,DIC="^ABS(503331,",(FR,TO)="?",DIS(0)="I $P($G(^ABS(503331,D0,0)),U,7)=ABSV(""SITE"")",(BY,FLDS)="[ABSV WEEKLY WORK SUMMARY]" D EN1^DIP,DIKILL^ABSVQ,OUT
 QUIT
SELORG ;PRINT SELECTED ORGANIZATIONS
 D ^ABSVSITE Q:'%
 S X="Using this option you may select up to 10 organization to print out per session.*" D MSG^ABSVQ W !
 S XZ=1,DIC=503334,DIC(0)="AEMNQZ",DIC("A")="Select Organization #1: "
 F ZI=1:1 Q:XZ>10  D ^DIC Q:+Y<0  W:'$D(^ABS(503335,"AD",+Y)) !,"THERE ARE NO ENTRIES IN THE TIME CARD FILE FOR THIS ORGANIZATION",*7 I $D(^(+Y)) S ABSVX("LIST",+Y)=$P(Y(0),"^",2),XZ=XZ+1,DIC("A")="Select Organization #"_XZ_": "
 K DIC I $D(ABSVX("LIST"))'>9 S X="No Organizations Selected.*" D MSG^ABSVQ G OUT
 S BPROMPT="Select Beginning Month/Year: ",EPROMPT="Select Ending Month: ",MONTH=""
 W ! D RANGE^ABSVTPR1 K MONTH
 G:Y<0 OUT S ABSVX("EDATE")=EDATE,ABSVX("BDATE")=$E(BDATE,1,5)_"00"
 S ZTRTN="SO1^ABSVTPR",ZTDESC="VOLUNTARY SELECTED ORGANIZATION LISTING",ZTSAVE("ABSV*")="",ZTSAVE("EDATE")="",ZTSAVE("BDATE")="" D ^ABSVQ D OUT Q
SO1 ;DQ SELECTED ORG LISTING
 K ^TMP("ABSVSELORG",$J)
 I '$D(ZTQUEUED) D WAIT^ABSVYN
 S DA=0
 F  S DA=$O(ABSVX("LIST",DA)) Q:'DA  D
  . S N=0
  . F  S N=$O(^ABS(503335,"AD",DA,N)) Q:'N  D
  . . S X=^ABS(503335,N,0)
  . . I $P(X,"^",12)=ABSV("SITE"),$P(X,"^",5)'<BDATE,$P(X,"^",5)'>EDATE S ^TMP("ABSVSELORG",$J,N)=""
  . . Q
  . Q
 K ABSVX("LIST") I '$D(^TMP("ABSVSELORG",$J)) S X="No Time Cards Found.*" D:'$D(ZTQUEUED) MSG^ABSVQ D:$D(ZTQUEUED) KILL^%ZTLOAD G OUT
 S IOP=ABIOP
 S L=0,L(0)=1,DIC="^ABS(503335,",BY="#+1.15,+4,NAME",BY(0)="^TMP(""ABSVSELORG"",$J,",(FR,TO)="",FLDS="[ABSV ORGANIZATION DETAIL LIST]"
 I $D(ABSV("CONDENSED")) S FLDS="[ABSV ORGANIZATION CONDENSED]",BY="#+1.15,+4,NAME"
 D EN1^DIP,DIKILL^ABSVQ
 K ^TMP("ABSVSELORG",$J)
 I $D(ZTQUEUED) D KILL^%ZTLOAD Q
 QUIT
CONDENSE ;PRINT SELECTED ORGANIZATION CONDENSED LIST
 S ABSV("CONDENSED")="" D SELORG
 K ABSV("CONDENSED") QUIT
CORG ;PRINT CONDENSED ORGANIZATION REPORT
 S ABSV("CONDENSED")="" D ORGLIST
 K ABSV("CONDENSED") QUIT
CODE ;PRINT LIST OF SIGNIN CODES
 D ^ABSVSITE Q:'%
 S DIC=503330,L=0,FLDS="[ABSV SIGN-IN LIST]",BY=".01"
 S:'$D(DIS(0)) DIS(0)="I $$ACTIVE^ABSVU2(D0,"_ABSV("INST")_",1)"
 D EN1^DIP
 D ^%ZISC
 QUIT
GAMES ;PRINT MASTER REGISTRATION LIST
 D ^ABSVSITE Q:'%
 S DIC=503330,L=0,(BY,FLDS)="[ABSV GAMES MASTER REGISTRATION]",(FR,TO)=",,"_ABSV("SITE")
 S:'$D(DIS(0)) DIS(0)="I $$ACTIVE^ABSVU2(D0,"_ABSV("INST")_",1)"
 D EN1^DIP
 D ^%ZISC
 QUIT
SHIRTS ;PRINT SHIRT ISSUE LIST FOR GAMES
 D ^ABSVSITE Q:'%
 S DIC=503330,L=0,(BY,FLDS)="[ABSV GAMES SHIRT LIST]"
 S:'$D(DIS(0)) DIS(0)="I $$ACTIVE^ABSVU2(D0,"_ABSV("INST")_",1)"
 S DIOBEG="S ABSVLINE=$S(IOM>95:40,1:25)"
 D EN1^DIP
 D ^%ZISC K ABSVLINE
 QUIT
SIGNIN ;PRINT SIGN-IN ROSTERS
 D ^ABSVSITE Q:'%
 S DIC=503330,L=0,(BY,FLDS)="[ABSV GAMES SIGN-IN LIST]"
 S:'$D(DIS(0)) DIS(0)="I $$ACTIVE^ABSVU2(D0,"_ABSV("INST")_",1)"
 S DIOBEG="S ABSVLINE=$S(IOM>95:40,1:25)"
 D EN1^DIP
 D ^%ZISC K ABSVLINE
 QUIT
ASSIGN ;PRINT ASSIGNMENT SCHEDULES
 D ^ABSVSITE Q:'%
 S DIC=503330,L=0,(BY,FLDS)="[ABSV GAMES ASSIGNMENT SCHEDULE]",(FR,TO)=ABSV("SITE")_",?,?"
 S:'$D(DIS(0)) DIS(0)="I $$ACTIVE^ABSVU2(D0,"_ABSV("INST")_",1)"
 D EN1^DIP
 D ^%ZISC
 QUIT
WORK ;PRINT WORK SCHEDULE
 D ^ABSVSITE Q:'%
 S DIC=503330,L=0,(BY,FLDS)="[ABSV GAMES WORK SCHEDULE]",(FR,TO)=ABSV("SITE")_",?,?"
 S:'$D(DIS(0)) DIS(0)="I $$ACTIVE^ABSVU2(D0,"_ABSV("INST")_",1)"
 D EN1^DIP
 D ^%ZISC
 QUIT