package com.sy.pojo;


public class Employee {

  private String eId;
  private String eIdCard;
  private String eName;
  private String eRfid;
  private String ePassword;
  private String eSex;
  private java.sql.Timestamp eBirthday;
  private java.sql.Timestamp eJointime;
  private String ePhone;
  private long eState;
  private String eIcon;
  private Integer eLevel;

  public Employee() {
  }

  public String getEId() {
    return eId;
  }

  public void setEId(String eId) {
    this.eId = eId;
  }


  public String getEIdCard() {
    return eIdCard;
  }

  public void setEIdCard(String eIdCard) {
    this.eIdCard = eIdCard;
  }


  public String getEName() {
    return eName;
  }

  public void setEName(String eName) {
    this.eName = eName;
  }


  public String getERfid() {
    return eRfid;
  }

  public void setERfid(String eRfid) {
    this.eRfid = eRfid;
  }


  public String getEPassword() {
    return ePassword;
  }

  public void setEPassword(String ePassword) {
    this.ePassword = ePassword;
  }


  public String getESex() {
    return eSex;
  }

  public void setESex(String eSex) {
    this.eSex = eSex;
  }


  public java.sql.Timestamp getEBirthday() {
    return eBirthday;
  }

  public void setEBirthday(java.sql.Timestamp eBirthday) {
    this.eBirthday = eBirthday;
  }


  public java.sql.Timestamp getEJointime() {
    return eJointime;
  }

  public void setEJointime(java.sql.Timestamp eJointime) {
    this.eJointime = eJointime;
  }


  public String getEPhone() {
    return ePhone;
  }

  public void setEPhone(String ePhone) {
    this.ePhone = ePhone;
  }


  public long getEState() {
    return eState;
  }

  public void setEState(long eState) {
    this.eState = eState;
  }


  public String getEIcon() {
    return eIcon;
  }

  public void setEIcon(String eIcon) {
    this.eIcon = eIcon;
  }


  public Integer getELevel() {
    return eLevel;
  }

  public void setELevel(Integer eLevel) {
    this.eLevel = eLevel;
  }

  @Override
  public String toString() {
    return "Employee{" +
            "eId='" + eId + '\'' +
            ", eIdCard='" + eIdCard + '\'' +
            ", eName='" + eName + '\'' +
            ", eRfid='" + eRfid + '\'' +
            ", ePassword='" + ePassword + '\'' +
            ", eSex='" + eSex + '\'' +
            ", eBirthday=" + eBirthday +
            ", eJointime=" + eJointime +
            ", ePhone='" + ePhone + '\'' +
            ", eState=" + eState +
            ", eIcon='" + eIcon + '\'' +
            ", eLevel=" + eLevel +
            '}';
  }
}


