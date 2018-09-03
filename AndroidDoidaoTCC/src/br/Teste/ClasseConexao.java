package br.Teste;

import java.util.ArrayList;
import java.util.List;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

public class ClasseConexao {
	SQLiteDatabase banco=null;
	String nomebanco="banco.db";
	Cursor cursor;	
	public static List<String> list;
	
	public boolean CriarBanco(Context cont){
		try{
		banco=cont.openOrCreateDatabase(nomebanco, Context.MODE_PRIVATE, null);
		String sql="CREATE TABLE IF NOT EXISTS contatos (nome TEXT, fone TEXT)";
		banco.execSQL(sql);
		return true;
		}
		catch(Exception e){
			return false;
		}
	}
	
	public boolean InserirDados(Context cont, String campo1, String campo2){
		try{
		banco=cont.openOrCreateDatabase(nomebanco,Context.MODE_PRIVATE,null);
		String sql="INSERT INTO contatos VALUES ('"+campo1+"'"+","+"'"+campo2+"'"+")";
		banco.execSQL(sql);
		return true;
		}
		catch(Exception e){
			return false;
		}
	}
	public boolean AlterarDados(Context cont, String campo1, String campo2, String campo3)
	{
		try{
		banco=cont.openOrCreateDatabase(nomebanco,Context.MODE_PRIVATE,null);
		String sql="update contatos set nome = '"+campo1+"'"+","+"fone ='"+campo2+"' where nome ='"+campo3+"'";
		banco.execSQL(sql);
		return true;
		}
		catch(Exception e){
			return false;
		}
	}
	
	
	
	public boolean ExcluirDados(Context cont, String campo1){
		try{
		banco=cont.openOrCreateDatabase(nomebanco,Context.MODE_PRIVATE,null);
		String sql="Delete from contatos where nome ='" + campo1 + "'";
		banco.execSQL(sql);
		return true;
		}
		catch(Exception e){
			return false;
		}
	
	}
	
	public List<String> ConsultarDados(Context cont){
		try{
	
		banco=cont.openOrCreateDatabase(nomebanco,Context.MODE_PRIVATE,null);
		String sql="SELECT * FROM contatos";
		cursor=banco.rawQuery(sql, null);
		list= new ArrayList<String>();
		if(cursor.moveToFirst()) 
		{
			do 
			{
				list.add(cursor.getString(0));
				list.add(cursor.getString(1));

			} while(cursor.moveToNext());
		}
		if(this.cursor != null && !this.cursor.isClosed())
		{
			cursor.close();
			banco.close();
		}
		return list;
		
		
		}
	catch(Exception e)
	{
		
	}

		return null;
		
}
}


