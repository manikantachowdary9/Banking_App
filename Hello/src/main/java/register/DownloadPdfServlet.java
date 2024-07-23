package register;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@WebServlet("/register/DownloadPdfServlet")
public class DownloadPdfServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Transaction> transactions = (List<Transaction>) request.getSession().getAttribute("transactions");

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=BANK_STATEMENT.pdf");

        try (OutputStream out = response.getOutputStream()) {
            Document document = new Document();
            PdfWriter.getInstance(document, out);

            document.open();
            
            Font boldFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
            Paragraph paragraph1 = new Paragraph("VelTech Bank", boldFont);
            paragraph1.setAlignment(Element.ALIGN_CENTER);
            document.add(paragraph1);
            Paragraph paragraph = new Paragraph("Transaction History", boldFont);
            paragraph.setAlignment(Element.ALIGN_CENTER);
            
            document.add(paragraph);
            
            document.add(new Paragraph("\n"));
            PdfPTable table = new PdfPTable(4); 
            table.setWidthPercentage(100);
            PdfPCell cell = new PdfPCell(new Paragraph("Account Number", boldFont));
            table.addCell(cell);
            cell = new PdfPCell(new Paragraph("Amount", boldFont));
            table.addCell(cell);
            cell = new PdfPCell(new Paragraph("Transaction Type", boldFont));
            table.addCell(cell);
            cell = new PdfPCell(new Paragraph("Transaction Time", boldFont));
            table.addCell(cell);
            for (Transaction transaction : transactions) {
                table.addCell(String.valueOf(transaction.getAccountNumber()));
                table.addCell(String.valueOf(transaction.getAmount()));
                table.addCell(transaction.getTransactionType());
                table.addCell(transaction.getTransactionTime());
            }
            document.add(table);

            document.close();
        } catch (DocumentException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
