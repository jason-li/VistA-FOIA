XU8P328 ;OIFOO/SO- POST INSTALL;6:40 AM  9 Mar 2004
 ;;8.0;KERNEL;**328**;Jul 10, 1995
 ;
 D ^XU8P328A ;EDIT COUNTY NAMES OF EXISTING COUNTY CODES($5.13) TO MATCH NPCD
 D ^XU8P328B ;ADD NPCD FIPS CODES TO COUNTY CODES(#5.13)
 D ^XU8P328C ;SYNC STATE(#5) COUNTY MULTIPLE TO COUNTY CODES(#(5.13)
 D ^XU8P328D ;SCAN PATIENT FILE FOR COUNTY STARTING WITH "ZZ"
 Q