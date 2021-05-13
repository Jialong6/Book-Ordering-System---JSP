package com.orm;

public class TComment {

    private Integer id;
    private Integer user_id;
    private String short_text;
    private Integer score;
    private String usefulness;
    private String isbn;
    private String trustfulness;

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getShort_text() {
        return short_text;
    }

    public void setShort_text(String short_text) {
        this.short_text = short_text;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getUsefulness() {
        return usefulness;
    }

    public void setUsefulness(String usefulness) {
        this.usefulness = usefulness;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getTrustfulness() {
        return trustfulness;
    }

    public void setTrustfulness(String trustfulness) {
        this.trustfulness = trustfulness;
    }


    public TComment(Integer id, String short_text, Integer score, String usefulness, String isbn, String trustfulness) {
        this.id = id;
        this.short_text = short_text;
        this.score = score;
        this.usefulness = usefulness;
        this.isbn = isbn;
        this.trustfulness = trustfulness;
    }

    public TComment() {

    }
}
