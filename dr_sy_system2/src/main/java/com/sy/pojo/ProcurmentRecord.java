package com.sy.pojo;


public class ProcurmentRecord {

  private String egNo;
  private String gNo;
  private String eId;
  private long exhibitNo;
  private java.sql.Timestamp exhibitTime;


  public String getEgNo() {
    return egNo;
  }

  public void setEgNo(String egNo) {
    this.egNo = egNo;
  }


  public String getGNo() {
    return gNo;
  }

  public void setGNo(String gNo) {
    this.gNo = gNo;
  }


  public String getEId() {
    return eId;
  }

  public void setEId(String eId) {
    this.eId = eId;
  }


  public long getExhibitNo() {
    return exhibitNo;
  }

  public void setExhibitNo(long exhibitNo) {
    this.exhibitNo = exhibitNo;
  }


  public java.sql.Timestamp getExhibitTime() {
    return exhibitTime;
  }

  public void setExhibitTime(java.sql.Timestamp exhibitTime) {
    this.exhibitTime = exhibitTime;
  }

  @Override
  public String toString() {
    return "ProcurmentRecord{" +
            "egNo='" + egNo + '\'' +
            ", gNo='" + gNo + '\'' +
            ", eId='" + eId + '\'' +
            ", exhibitNo=" + exhibitNo +
            ", exhibitTime=" + exhibitTime +
            '}';
  }
}
