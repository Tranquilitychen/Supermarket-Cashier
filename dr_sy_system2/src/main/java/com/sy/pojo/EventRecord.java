package com.sy.pojo;

public class EventRecord {

  private String evNo;
  private Integer etNo;
  private String eId;
  private java.sql.Timestamp evBegintime;
  private java.sql.Timestamp evEndtime;
  private Integer evState;
  private String evName;

  public EventRecord() {
  }

  public String getEvNo() {
    return evNo;
  }

  public void setEvNo(String evNo) {
    this.evNo = evNo;
  }


  public Integer getEtNo() {
    return etNo;
  }

  public void setEtNo(Integer etNo) {
    this.etNo = etNo;
  }


  public String getEId() {
    return eId;
  }

  public void setEId(String eId) {
    this.eId = eId;
  }


  public java.sql.Timestamp getEvBegintime() {
    return evBegintime;
  }

  public void setEvBegintime(java.sql.Timestamp evBegintime) {
    this.evBegintime = evBegintime;
  }


  public java.sql.Timestamp getEvEndtime() {
    return evEndtime;
  }

  public void setEvEndtime(java.sql.Timestamp evEndtime) {
    this.evEndtime = evEndtime;
  }


  public Integer getEvState() {
    return evState;
  }

  public void setEvState(Integer evState) {
    this.evState = evState;
  }


  public String getEvName() {
    return evName;
  }

  public void setEvName(String evName) {
    this.evName = evName;
  }


  @Override
  public String toString() {
    return "EventRecord{" +
            "evNo='" + evNo + '\'' +
            ", etNo=" + etNo +
            ", eId='" + eId + '\'' +
            ", evBegintime=" + evBegintime +
            ", evEndtime=" + evEndtime +
            ", evState=" + evState +
            ", evName='" + evName + '\'' +
            '}';
  }
}
