/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.wmvnocr;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import net.sourceforge.tess4j.TesseractException;

/**
 * Servlet to handle File upload request from Client
 * @author Javin Paul
 */

public class FileUploadHandler extends HttpServlet {
    private final String UPLOAD_DIRECTORY = "C:/Users/User/Documents/NetBeansProjects/wmvnOCR/src/main/webapp/uploads";
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


    	
        String ruta="";
         String name="";
         String text="ocrtransalate";
         String leng="";
        //process only if its multipart content
        if(ServletFileUpload.isMultipartContent(request)){
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(request);
              
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
                        name = new File(item.getName()).getName();
                        ruta=UPLOAD_DIRECTORY + File.separator + name;
                        item.write( new File(ruta));
                        
                       
                    }
                    if (item.isFormField()) {
                        
                        if(item.getFieldName().equalsIgnoreCase("lenguaje")){
                        	leng=item.getString();
                        }
                    }
                }
           
               //File uploaded successfully
              // System.out.println(OCR.Procesar(ruta));
                
            	try {
        			text=OCR.Procesar(ruta,leng);
        		} catch (TesseractException e) {
        			// TODO Auto-generated catch block
        			e.printStackTrace();
        		}
            	File fileSaveDir = new File(UPLOAD_DIRECTORY);
            	fileSaveDir.exists();
               request.setAttribute("message", "Archivo Procesado");
               request.setAttribute("ruta", ruta);
               request.setAttribute("name", name);
               request.setAttribute("texto", text);
            } catch (Exception ex) {
               request.setAttribute("message", "Error de Subida " + ex);
            }          
         
        }else{
            request.setAttribute("message",
                                 "Error");
        }
    
        request.getRequestDispatcher("/result.jsp").forward(request, response);
     
    }
  
}
