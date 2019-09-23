package com.sy.pojo;


public class Event {

  private Integer etNo;
  private String etTypename;
  private String etDescript;
  private Integer etState;

  public Event(){

  }

  public Integer getEtNo() {
    return etNo;
  }

  public void setEtNo(Integer etNo) {
    this.etNo = etNo;
  }


  public String getEtTypename() {
    return etTypename;
  }

  public void setEtTypename(String etTypename) {
    this.etTypename = etTypename;
  }


  public String getEtDescript() {
    return etDescript;
  }

  public void setEtDescript(String etDescript) {
    this.etDescript = etDescript;
  }


  public Integer getEtState() {
    return etState;
  }

  public void setEtState(Integer etState) {
    this.etState = etState;
  }

  @Override
  public String toString() {
    return "Event{" +
            "etNo=" + etNo +
            ", etTypename='" + etTypename + '\'' +
            ", etDescript='" + etDescript + '\'' +
            ", etState=" + etState +
            '}';
  }
}
