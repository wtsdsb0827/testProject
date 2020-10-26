package com.bgs.ssm.pojo;

import org.springframework.beans.factory.annotation.Value;

import java.util.Objects;
public class FuLei {

    protected int eat;

    protected int getEat() {
        System.out.println("dsfsdf");
        return 10;
    }

    public void setEat(int eat) {
        this.eat=eat;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FuLei fuLei = (FuLei) o;
        return eat == fuLei.eat;
    }

    @Override
    public int hashCode() {
        return Objects.hash(eat);
    }

    public FuLei(int eat) {
        this.eat = eat;
    }
}
