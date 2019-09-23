package com.sy.pojo;


import java.sql.Timestamp;

/**
 * @author manager
 */
public class Orders {

  private String oNo;
  private String eId;
  private Timestamp oTime;
  private double oCost;
  private String oDescript;


  public String getONo() {
    return oNo;
  }

  public void setONo(String oNo) {
    this.oNo = oNo;
  }


  public String getEId() {
    return eId;
  }

  public void setEId(String eId) {
    this.eId = eId;
  }

  public Timestamp getOTime() {
    return oTime;
  }

  public void setOTime(Timestamp oTime) {
    this.oTime = oTime;
  }

  public double getOCost() {
    return oCost;
  }

  public void setOCost(double oCost) {
    this.oCost = oCost;
  }


  public String getODescript() {
    return oDescript;
  }

  public void setODescript(String oDescript) {
    this.oDescript = oDescript;
  }

  @Override
  public String toString() {
    return "Orders{" +
            "oNo='" + oNo + '\'' +
            ", eId='" + eId + '\'' +
            ", oTime=" + oTime +
            ", oCost=" + oCost +
            ", oDescript='" + oDescript + '\'' +
            '}';
  }
}
