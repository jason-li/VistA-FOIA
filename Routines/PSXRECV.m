PSXRECV ;BIR/WPB-Downloads Data from Mailman Msg to Files ;04/08/97  2:06 PM 
 ;;2.0;CMOP;**34,38,45**;11 Apr 97
HDR S (PSXORDCT,PSXSMSG,PSXRTRN,PSXRXS)=0,ZTREQ="@"
 K DD,DO,^TMP($J,"PSXREV") S PSXXMRG=XMRG
 S PSXBAT=$P($G(XMRG),U,2),PSXSITE=$P($G(XMRG),U,3),PSXSYST=$P(XMRG,U,4),SDATE=$P($G(XMRG),U,6)
 S SITEN=$P($G(XMRG),U,5)
 S PSXREF=SITEN_"-"_PSXBAT,PSXSTART=$P(XMRG,U,8),PSXFROM=XMFROM
 S PSXSENDR=$P(XMRG,U,7),PSXLAST=$P(XMRG,U,9),PSXDIV=$P(XMRG,U,10),XSITE=$P(XMRG,U,11),XMSER="S."_XQSOP,TXMZ=XQMSG
 ;S X=SITEN,DIC="4",DIC(0)="MOXZ" S:$D(^PSX(552,"D",X)) X=$E(X,2,99) D ^DIC S SITENUM=+Y K DIC,Y,X ;****DOD L1
 S X=SITEN,AGNCY="VASTANUM" S:$D(^PSX(552,"D",X)) X=$E(X,2,99),AGNCY="DMIS" S SITENUM=$$IEN^XUMF(4,AGNCY,X) K DIC,Y,X,AGNCY ;****DOD L1
 S OLDBAT=$P($G(XMRG),U,12) I OLDBAT'="" S PSXRTRN=1,PSXOLD=SITEN_"-"_OLDBAT
 G:$G(SITENUM)="" EXIT1
 S XXR=$O(^PSX(552,"B",$G(SITENUM),""))
 G:'$D(^PSX(552,"C",$G(XXR))) EXIT1
 S:$G(^XMB(3.9,TXMZ,0))["CMOP Controlled Substances Transmission" CSB=1
 I $G(CSB)=1 N X S X=$$FMADD^XLFDT(DT,+3),^XTMP("PSXCS",PSXREF)=X_U_DT_U_"CS TRANSMISSION" K X
 ;this would be a good place to send an alert or mail message if the
 ;transmitting site was not active in the CMOP files
 I $G(XMFROM)["@" S DOMAIN=$P($G(XMFROM),"@",2)
 I $G(XMFROM)'["@" S DOMAIN=""
 S DOMAIN=""
 S SAME=$O(^PSX(552.1,"B",PSXREF,"")) S:$G(SAME)'="" PSXRTRN=2 D:$G(SAME)'="" CHKDUP^PSXRECV1 G:$G(FLAG5)>0 EXIT
 I PSXRTRN=1 S RR=$O(^PSX(552.1,"B",PSXOLD,"")) D
 .Q:$G(RR)'>0
 .S OLDSDT=$P(^PSX(552.1,RR,0),U,4)
 .S CHK=$P($G(^PSX(552.1,RR,0)),U,2) D
 .S:$G(CHK)=3 PSXFLG1=2
 .I (CHK=2)!(CHK=1) S PSXJOB=""
 .;I CHK="" S PSXJOB=2,PSXERR=2_"^"_2 D ^PSXERR Q
 .;I (CHK=3)!(CHK=4) S PSXJOB=2,PSXERR=2_"^"_CHK D ^PSXERR Q
 .;I CHK=5 S PSXJOB=2,PSXERR=2_"^"_CHK
STRT I PSXRTRN=1,($G(RR)'=""),($P(^PSX(552.1,$G(RR),0),"^",2)=2) L +^PSX(552.1,$G(RR)):600 G:'$T EXIT S $P(^PSX(552.1,RR,0),"^",2)=5 S DA=RR,DIK="^PSX(552.1," D IX^DIK K DA,DIK L -^PSX(552.1,$G(RR))
 S:$D(^PSX(552.1,"ART",$G(PSXREF))) PSXRTRN=3
 S X=PSXREF,DIC="^PSX(552.1,",DIC(0)="Z"
 S DIC("DR")="1////"_$S(PSXRTRN<1:"1",PSXRTRN>0:"5",1:"")_";2////"_PSXDIV_";3////"_XSITE_";4////"_PSXSENDR_";5////"_SDATE_";8////"_PSXSTART_";9////"_PSXLAST_$S(PSXRTRN=1:";13////"_PSXOLD_";12////1",1:"")_";21////"_$G(CSB)
 D F K DIC,X,DA,CSB S (OLDDA,PSXDA)=+Y
 I '$D(^PSX(552.4,"B",PSXDA)) K DD,DO S X=PSXDA,DIC(0)="Z",DIC="^PSX(552.4," D F S DA515=+Y
 F  X XMREC G:$G(XMER)<0 EX^PSXSERV D:$E(XMRG,1,6)["NTE|1|" SITE Q:$E(XMRG,1,5)["$$END"  G:$E(XMRG,1,4)["$MSG" MSG
 K XMER,XMREC,XMRG
 G EXIT
 Q
F D FILE^DICN Q
SITE S ^PSX(552.1,PSXDA,"S",0)="^552.114A^^"
 K DO,DD
 L +^PSX(552.1,PSXDA,"S"):600 G:'$T EXIT
 S X=XMRG,DA(1)=PSXDA,DIC="^PSX(552.1,"_PSXDA_",""S"",",DIC(0)="Z" D F
 F  X XMREC G:$E(XMRG,1,4)["$MSG" MSG G:$E(XMRG,1,9)["$$END" EXIT S X=XMRG,DA(1)=PSXDA,DIC="^PSX(552.1,"_PSXDA_",""S"",",DIC(0)="Z" D F K DA,DIC,X
 L -^PSX(552.1,PSXDA,"S")
 Q
MSG S PSXORDCT=PSXORDCT+1
 K DD,DO,PSXMSG,LNCNT,PSXDA
 S I=1,PSXMSG=$P(XMRG,U,2),(X,PSXID)=PSXREF_"-"_PSXMSG S:PSXSMSG=0 PSXSMSG=PSXMSG S DIC="^PSX(552.2,",DIC(0)="Z",DIC("DR")="1////4;2////"_$H D F S PSXDA=+Y
 S ^PSX(552.2,PSXDA,"T",0)="^552.27A^^"
 F  X XMREC G:$E(XMRG,1,4)["$MSG" QUE S:$E(XMRG,1,4)["MSH|" $P(XMRG,"|",10)=PSXID S:$E(XMRG,1,7)["ORC|NW" PSXRXS=PSXRXS+1 D:$E(XMRG,1,4)["RX1|" RX1 D:$E(XMRG,1,4)["ZX1|" ZX1 D:$E(XMRG,1,4)["PID|" PID G:$E(XMRG,1,9)["$$END" QUE D
 .L +^PSX(552.2,PSXDA):30 S ^PSX(552.2,PSXDA,"T",I,0)=$G(XMRG) L -^PSX(552.2,PSXDA) S $P(^PSX(552.2,PSXDA,"T",0),U,3)=I,$P(^(0),U,4)=I,I=I+1 I $E(XMRG,1,4)["ZX1|" S DA(1)=PSXDA,(SUBDA,DA)=I-1,DIK="^PSX(552.2,"_PSXDA_",""T""," D IX^DIK K DA,DIK
 Q
PID I $E(XMRG,1,4)["PID|" S NAME=$P(XMRG,"|",6),NAME=$TR(NAME,"^",",") Q
RX1 I $E(XMRG,1,4)["RX1|" S RXNDX=$P(XMRG,"|",2),DRG515=$P($P(XMRG,"|",15),"^",1),QTY515=$P(XMRG,"|",13),PSXDRG=$P(XMRG,U,2)
 S FL515=(+$P($P(XMRG,"|",2),"-",3)-1)
 Q
ZX1 I $E(XMRG,1,4)["ZX1|" S RX515=$P(XMRG,"|",2),PSXCS=$P($G(XMRG),"|",15) D F515^PSXRECV1
 Q
QUE L +^PSX(552.2,PSXDA):600 G:'$T EXIT
 S DA=PSXDA,DIE="^PSX(552.2,",DR="1////1;2////"_$H D ^DIE K DA,DIE,DR
 L -^PSX(552.2,PSXDA)
 I $E(XMRG,1,9)["$$END" G UPDATE^PSXRECV1
 G MSG
 ;
EXIT S XMZ=TXMZ,XMSER="S.PSXX CMOP SERVER" D REMSBMSG^XMA1C
EXIT1 I $G(OLDDA)'="" S DA=OLDDA,DIK="^PSX(552.1," D IX^DIK K DA,DIK
 I $G(SAME)'="" S DA=SAME,DIK="^PSX(552.1," D IX^DIK K DA,DIK
 K PSXSTART,PSXEND,PSXRXCT,PSXMSGCT,PSXSMSG,PSXLAST,PSXRXS,PSXORDCT,PSXSITE,PSXTDT,PSXFTDT,%,DOMAIN,PSXFLAG,I,OLDDA,PSXID,PSXSENDR,PSXREF,PSXMSG,PSXBAT,SDATE,SDT,SUBDA,PSXSYST,X,Y,XMFROM,SITENUM
 K XMSER,XQMSG,XQSOP,OLDBAT,XMZ,PSXDIV,XSITE,CHK,REC,RR,RRR,SITEN,PSXJOB,PSXERR,PSXFROM,PSXOLD,PSXRTRN,XXR,DA515,DRG515,FL515,QTY515,RX515,SAME,OLDSDT,OLDTM,PSXDRG,NAME,NAME1,FLAG5,PSXXMGR
 K NM5521,RXNDX
 Q