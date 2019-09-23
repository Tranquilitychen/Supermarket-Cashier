package com.sy.pojo;


public class Goodstype {

  private String gtNo;
  private String gtName;
  private String gtDescript;
  private long gtState;
  private String gtRemark;
  private String gtPno;
  private long gtLevel;
  private long gtIsparent;

  @Override
  public String toString() {
    return "Goodstype{" +
            "gtNo='" + gtNo + '\'' +
            ", gtName='" + gtName + '\'' +
            ", gtDescript='" + gtDescript + '\'' +
            ", gtState=" + gtState +
            ", gtRemark='" + gtRemark + '\'' +
            ", gtPno='" + gtPno + '\'' +
            ", gtLevel=" + gtLevel +
            ", gtIsparent=" + gtIsparent +
            '}';
  }

  public String getGtNo() {
    return gtNo;
  }

  public void setGtNo(String gtNo) {
    this.gtNo = gtNo;
  }


  public String getGtName() {
    return gtName;
  }

  public void setGtName(String gtName) {
    this.gtName = gtName;
  }


  public String getGtDescript() {
    return gtDescript;
  }

  public void setGtDescript(String gtDescript) {
    this.gtDescript = gtDescript;
  }


  public long getGtState() {
    return gtState;
  }

  public void setGtState(long gtState) {
    this.gtState = gtState;
  }


  public String getGtRemark() {
    return gtRemark;
  }

  public void setGtRemark(String gtRemark) {
    this.gtRemark = gtRemark;
  }


  public String getGtPno() {
    return gtPno;
  }

  public void setGtPno(String gtPno) {
    this.gtPno = gtPno;
  }


  public long getGtLevel() {
    return gtLevel;
  }

  public void setGtLevel(long gtLevel) {
    this.gtLevel = gtLevel;
  }


  public long getGtIsparent() {
    return gtIsparent;
  }

  public void setGtIsparent(long gtIsparent) {
    this.gtIsparent = gtIsparent;
  }

}
