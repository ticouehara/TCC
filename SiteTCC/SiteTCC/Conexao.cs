﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class Conexao
{

    SqlConnection conexao = new SqlConnection();

    private SqlConnection conectar()
    {
        conexao.ConnectionString = ConfigurationManager.AppSettings["DBConnectionString"];
        conexao.Open();
        return conexao;
    }

    public void desconectar()
    {
        if (conexao.State == ConnectionState.Open)
        {
            conexao.Close();
            conexao.Dispose();
            conexao = null;
        }
    }

    public DataTable executa_sql(String comando_sql)
    {
        conectar();
        SqlDataAdapter adaptador = new SqlDataAdapter(comando_sql, conexao);
        DataSet ds = new DataSet();
        adaptador.Fill(ds);
        desconectar();
        if (ds.Tables.Count > 0)
            return ds.Tables[0];
        return null;
    }

    public bool manutencao(String comando_sql) //incluir, alterar, excluir
    {
        conectar();
        SqlCommand comando = new SqlCommand();
        comando.CommandText = comando_sql;
        comando.Connection = conexao;
        conexao.Open();
        comando.ExecuteScalar();
        return true;
    }

}
