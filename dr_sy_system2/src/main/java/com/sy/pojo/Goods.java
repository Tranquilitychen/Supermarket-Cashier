package com.sy.pojo;


public class Goods {

  private String gNo;
  private String gtNo;
  private String gName;
  private String gDescript;
  private String gBarcode;
  private String gUnit;
  private double gPrice;
  private Integer gState;
  private Integer gCount;
  private String eId;
  private java.sql.Timestamp exhibitTime;


  public Goods() {
  }

  public String getGNo() {
    return gNo;
  }

  public void setGNo(String gNo) {
    this.gNo = gNo;
  }


  public String getGtNo() {
    return gtNo;
  }

  public void setGtNo(String gtNo) {
    this.gtNo = gtNo;
  }


  public String getGName() {
    return gName;
  }

  public void setGName(String gName) {
    this.gName = gName;
  }


  public String getGDescript() {
    return gDescript;
  }

  public void setGDescript(String gDescript) {
    this.gDescript = gDescript;
  }


  public String getGBarcode() {
    return gBarcode;
  }

  public void setGBarcode(String gBarcode) {
    this.gBarcode = gBarcode;
  }


  public String getGUnit() {
    return gUnit;
  }

  public void setGUnit(String gUnit) {
    this.gUnit = gUnit;
  }


  public double getGPrice() {
    return gPrice;
  }

  public void setGPrice(double gPrice) {
    this.gPrice = gPrice;
  }


  public Integer getGState() {
    return gState;
  }

  public void setGState(Integer gState) {
    this.gState = gState;
  }


  public Integer getGCount() {
    return gCount;
  }

  public void setGCount(Integer gCount) {
    this.gCount = gCount;
  }


  public String getEId() {
    return eId;
  }

  public void setEId(String eId) {
    this.eId = eId;
  }


  public java.sql.Timestamp getExhibitTime() {
    return exhibitTime;
  }

  public void setExhibitTime(java.sql.Timestamp exhibitTime) {
    this.exhibitTime = exhibitTime;
  }

  @Override
  public String toString() {
    return "Goods{" +
            "gNo='" + gNo + '\'' +
            ", gtNo='" + gtNo + '\'' +
            ", gName='" + gName + '\'' +
            ", gDescript='" + gDescript + '\'' +
            ", gBarcode='" + gBarcode + '\'' +
            ", gUnit='" + gUnit + '\'' +
            ", gPrice=" + gPrice +
            ", gState=" + gState +
            ", gCount=" + gCount +
            ", eId='" + eId + '\'' +
            ", exhibitTime=" + exhibitTime +
            '}';
  }
}
