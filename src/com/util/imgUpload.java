package com.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.Part;

public class imgUpload {
	public byte[] uploud(ServletContext path, Part part) throws IOException {

		String saveDir = "/imges_uploaded";
		String realPath = path.getRealPath(saveDir);
		String filename = null;
		File fsaveDir = new File(realPath);
		File f = null;
		byte[] buf = null;

		if (!fsaveDir.exists())
			fsaveDir.mkdirs();

		if (getFileName(part) != null && part.getContentType() != null) {
			filename = getFileName(part);
			f = new File(fsaveDir, filename);

			part.write(f.toString());
			buf = getPicByteArray(f.toString());

		}else{
			return null;
		}

		return buf;
	}

	public String getFileName(Part part) {
		String header = part.getHeader("content-disposition");
		String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();

		if (filename.length() == 0) {
			return null;
		}
		return filename;
	}

	public static byte[] getPicByteArray(String path) throws IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];
		int i;
		while ((i = fis.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		fis.close();

		return baos.toByteArray();
	}
}
