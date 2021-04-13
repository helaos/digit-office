package com.fatehole.office.util;

/**
 * @author helaos
 * @version 1.0.0
 * @date Create in 2021/04/12/21:58
 */
public class ResponseBean {

    private Integer status;

    private String msg;

    private Object data;

    public static ResponseBean ok(String msg) {
        return new ResponseBean(200, msg, null);
    }

    public static ResponseBean ok(String msg, Object data) {
        return new ResponseBean(200, msg, data);
    }

    public static ResponseBean error(String msg) {
        return new ResponseBean(500, msg, null);
    }

    public static ResponseBean error(String msg, Object data) {
        return new ResponseBean(500, msg, data);
    }

    private ResponseBean() {
    }

    private ResponseBean(Integer status, String msg, Object data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
