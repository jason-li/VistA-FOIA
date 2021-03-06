TIULIP ; SLC/JER - Lipid Profile Loader ;7/7/95  15:22
 ;;1.0;TEXT INTEGRATION UTILITIES;;Jun 20, 1997
MAIN(DFN,EARLY,LATE,DISPLAY,TARGET,LINE) ; Control branching
 N TIUI,TIUCNT,TIUDT,TIUY S TIUCNT=0
 K ^TMP("LRAPI",$J)
 I '$D(^DPT(DFN,"LR")) D NOLABS G LABX
 S LRDFN=+^DPT(DFN,"LR") I '$D(^LR(LRDFN)) D NOLABS G LABX
 I +$G(DISPLAY) W !,"Gathering Laboratory Data."
 D LIPIDS^TIULO(.TIUY,DFN,$G(EARLY),$G(LATE))
 I $G(TIUY(1))="No Lab Data" D NOLABS G LABX
 S TIUI="" F  S TIUI=$O(TIUY(TIUI)) Q:TIUI=""  D
 . N TIUX
 . S TIUDT=0 F  S TIUDT=$O(TIUY(TIUI,TIUDT)) Q:+TIUDT'>0  D
 . . S TIUCNT=TIUCNT+1 D LINE
LABX Q "~@"_$NA(@TARGET)
NOLABS ; Handles Case Where no Labs are found to satisfy criteria
 S LINE=$S(+$G(LINE):+$G(LINE),1:1),@TARGET@(LINE,0)="No data available"
 S LINE=+$G(LINE)+1,@TARGET@(LINE,0)=" "
 S @TARGET@(0)="^^"_LINE_"^"_LINE_"^"_DT_"^^"
 Q
LINE ; Line-wrap with comma-delimited data
 N X,Y
 I TIUCNT#2'>0 Q
 S TIUX=$$SETSTR^VALM1(TIUI_":","",15,24)
 S TIUX=$$SETSTR^VALM1($G(TIUY(TIUI,TIUDT)),TIUX,47,8)
 S TIUX=$$SETSTR^VALM1($G(TIUY(TIUI,+$O(TIUY(TIUI,TIUDT)))),TIUX,63,8)
 S LINE=+$G(LINE)+1
 S @TARGET@(LINE,0)=TIUX
 S @TARGET@(0)="^^"_LINE_"^"_LINE_"^"_DT_"^^"
 I +$G(DISPLAY) W "."
 Q
