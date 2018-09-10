package br.Teste;

import java.io.BufferedInputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;

import org.apache.http.util.ByteArrayBuffer;

import br.Teste.MainActivity;
import br.Teste.MenuPrincipal;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity {

	Class1 xx = new Class1();
  
	

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        Button btnLogin1 = (Button)findViewById(R.id.btnLogin1);
        final EditText txtCNPJ = (EditText)findViewById(R.id.txtCNPJ);
        final EditText txtSenha = (EditText)findViewById(R.id.txtSenha);
        final TextView txtEsqueci = (TextView)findViewById(R.id.txtEsqueci);
         
        btnLogin1.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View arg0) {

				String texto = null, aux="";
				xx.list=new ArrayList<String>();
				try {					
					//PODE USAR O IP 10.0.2.2 ,COMO LOCALHOST
					//CODIFICA ACENTOS UTF-8 
					URL url = new URL("http://10.0.2.2/default_login.aspx?cnpj="+txtCNPJ.getText().toString()+"&senhaCli="+txtSenha.getText().toString()+"");
					URLConnection conexao = url.openConnection();
					InputStream inputStream = conexao.getInputStream();
					BufferedInputStream bufferedInput = new BufferedInputStream(inputStream);
					ByteArrayBuffer byteArray = new ByteArrayBuffer(1);
					int current = 0;
					while((current = bufferedInput.read()) != -1)
					{
						byteArray.append((byte)current);
					}
					texto = new String(byteArray.toByteArray());
					inputStream.close(); 
					
					
					
					int tamanho = texto.length();
					
						boolean achou=false;
					    for(int i=0;i<tamanho;i++) 
					    {
		                    if(texto.charAt(i)=='#')
		                    {
		                    	achou=true;
		                    	i++;
		                    }
		                    if(texto.charAt(i)=='^')
		                    achou=false;
		                    if(achou)
		                    {

								if(texto.charAt(i)!=';')
									aux=aux+texto.charAt(i);
								else
								{
					  			
								}
		                    }
					    }
					    
					    if (aux.equals("")){
					    	Toast.makeText(MainActivity.this, "Usuário ou senha Incorretos", Toast.LENGTH_LONG).show();
					    }
					    else {
					    	Intent i = new Intent(MainActivity.this,MenuPrincipal.class);
					    	startActivity(i);
					    }
					 
				} catch (Exception e){}	 	
			
			}
		});
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
