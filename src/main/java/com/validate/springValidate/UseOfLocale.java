package com.validate.springValidate;

import java.text.NumberFormat;
import java.util.Locale;

public class UseOfLocale {
public static void main(String[] args) {
	int i=100;
	Locale l=new Locale("en","IN");
	Locale lh=new Locale("hi","IN");
	Locale.setDefault(l);
	System.out.println("The Locale is -"+l.getDefault().toString());
	System.out.println("The Language of Locale"+l.getDefault().getDisplayLanguage());
		NumberFormat nf=NumberFormat.getCurrencyInstance(l);
		String money=nf.format(i);
		System.out.println(money);
}
}
