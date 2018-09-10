package br.Teste;

import java.util.ArrayList;
import java.util.List;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;

public class Class1 extends Activity
{
	public static List<String> list;
	
	public void chamaAlerta(String titulo, String mensagem, Context contexto) 
	{
		AlertDialog.Builder alerta = new AlertDialog.Builder(contexto);
		alerta.setTitle(titulo);
		alerta.setMessage(mensagem); 
		alerta.setNeutralButton("OK", null);
		alerta.show();
	}
}