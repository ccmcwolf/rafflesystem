package com.paypal.dg;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Iterator;
import java.io.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import javax.servlet.http.*;
import com.paypal.dg.PaypalFunctions;

public class OrderConfirm extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*
		 * '------------------------------------ ' This is the landing page
		 * after authorizing payment on PayPal lightbox ' Get the token
		 * parameter from Querystring '------------------------------------
		 */
		String token = request.getParameter("token");
		String payerId = request.getParameter("PayerID");

		if (token != null) {

			// IMPORTANT NOTE: Please import Class paypalfunctions if not in the
			// same package level.
			// import paypalfunctions;

			/*
			 * '------------------------------------ ' this step is required to
			 * get ToatalPaymentAmount to make DoExpressCheckout API call, '
			 * this step is required only if you are not storing the
			 * SetExpressCheckout API call's request values in you database. '
			 * ------------------------------------
			 */
			PaypalFunctions ppf = new PaypalFunctions();
			HashMap nvp = ppf.getPaymentDetails(token);
		
			String strAck = nvp.get("ACK").toString();
			String finalPaymentAmount = null;
			if (strAck != null
					&& (strAck.equalsIgnoreCase("Success") || strAck
							.equalsIgnoreCase("SuccessWithWarning"))) {
				/*
				 * '------------------------------------ ' The paymentAmount is
				 * the total value of the purchase '
				 */
				finalPaymentAmount = nvp.get("AMT").toString();
			}
			String serverName = request.getServerName();
			
			Map item = new HashMap();
			item.put("name", nvp.get("L_PAYMENTREQUEST_0_NAME0"));
			item.put("amt", nvp.get("L_PAYMENTREQUEST_0_AMT0"));
			item.put("qty", nvp.get("L_PAYMENTREQUEST_0_QTY0"));
			/*
			 * '------------------------------------ ' Calls the
			 * DoExpressCheckoutPayment API call ' ' The ConfirmPayment function
			 * is defined in the file PayPalFunctions.java ' that should be
			 * included at the top of this file.
			 * '-------------------------------------------------
			 */

			nvp = ppf.confirmPayment(token, payerId, finalPaymentAmount,
					serverName, item);
			
			strAck = nvp.get("ACK").toString();
			
			
			if (strAck != null
					&& (strAck.equalsIgnoreCase("Success") || strAck
							.equalsIgnoreCase("SuccessWithWarning"))) {
				/*
				 * TODO: Proceed with desired action after the payment (ex:
				 * start download, start streaming, Add coins to the game.. etc)
				 * '
				 * *************************************************************
				 * ******************************************************* ' '
				 * THE PARTNER SHOULD SAVE THE KEY TRANSACTION RELATED
				 * INFORMATION LIKE ' transactionId & orderTime ' IN THEIR OWN
				 * DATABASE ' AND THE REST OF THE INFORMATION CAN BE USED TO
				 * UNDERSTAND THE STATUS OF THE PAYMENT '
				 * '**********************
				 * ***************************************
				 * *******************************************************
				 */

				String transactionId = nvp.get("PAYMENTINFO_0_TRANSACTIONID").toString(); // '
																			// Unique
																			// transaction
																			// ID
																			// of
																			// the
																			// payment.
																			// Note:
																			// If
																			// the
																			// PaymentAction
																			// of
																			// the
																			// request
																			// was
																			// Authorization
																			// or
																			// Order,
																			// this
																			// value
																			// is
																			// your
																			// AuthorizationID
																			// for
																			// use
																			// with
																			// the
																			// Authorization
																			// &
																			// Capture
																			// APIs.
				String transactionType = nvp.get("PAYMENTINFO_0_TRANSACTIONTYPE").toString(); // '
																				// The
																				// type
																				// of
																				// transaction
																				// Possible
																				// values:
																				// l
																				// cart
																				// l
																				// express-checkout
				String paymentType = nvp.get("PAYMENTINFO_0_PAYMENTTYPE").toString(); // '
																		// Indicates
																		// whether
																		// the
																		// payment
																		// is
																		// instant
																		// or
																		// delayed.
																		// Possible
																		// values:
																		// l
																		// none
																		// l
																		// echeck
																		// l
																		// instant
				String orderTime = nvp.get("PAYMENTINFO_0_ORDERTIME").toString(); // '
																	// Time/date
																	// stamp of
																	// payment
				String amt = nvp.get("PAYMENTINFO_0_AMT").toString(); // ' The final amount
														// charged, including
														// any shipping and
														// taxes from your
														// Merchant Profile.
				String currencyCode = nvp.get("PAYMENTINFO_0_CURRENCYCODE").toString(); // ' A
																			// three-character
																			// currency
																			// code
																			// for
																			// one
																			// of
																			// the
																			// currencies
																			// listed
																			// in
																			// PayPay-Supported
																			// Transactional
																			// Currencies.
																			// Default:
																			// USD.
				String feeAmt = nvp.get("PAYMENTINFO_0_FEEAMT").toString(); // ' PayPal fee
																// amount
																// charged for
																// the
																// transaction
			
				String taxAmt = nvp.get("PAYMENTINFO_0_TAXAMT").toString(); // ' Tax charged
																// on the
																// transaction.
				
				/*
				 * ' Status of the payment: 'Completed: The payment has been
				 * completed, and the funds have been added successfully to your
				 * account balance. 'Pending: The payment is pending. See the
				 * PendingReason element for more information.
				 */

				String paymentStatus = nvp.get("PAYMENTINFO_0_PAYMENTSTATUS").toString();

				/*
				 * 'The reason the payment is pending: ' none: No pending reason
				 * ' address: The payment is pending because your customer did
				 * not include a confirmed shipping address and your Payment
				 * Receiving Preferences is set such that you want to manually
				 * accept or deny each of these payments. To change your
				 * preference, go to the Preferences section of your Profile. '
				 * echeck: The payment is pending because it was made by an
				 * eCheck that has not yet cleared. ' intl: The payment is
				 * pending because you hold a non-U.S. account and do not have a
				 * withdrawal mechanism. You must manually accept or deny this
				 * payment from your Account Overview. ' multi-currency: You do
				 * not have a balance in the currency sent, and you do not have
				 * your Payment Receiving Preferences set to automatically
				 * convert and accept this payment. You must manually accept or
				 * deny this payment. ' verify: The payment is pending because
				 * you are not yet verified. You must verify your account before
				 * you can accept this payment. ' other: The payment is pending
				 * for a reason other than those listed above. For more
				 * information, contact PayPal customer service.
				 */

				String pendingReason = nvp.get("PAYMENTINFO_0_PENDINGREASON").toString();

				/*
				 * 'The reason for a reversal if TransactionType is reversal: '
				 * none: No reason code ' chargeback: A reversal has occurred on
				 * this transaction due to a chargeback by your customer. '
				 * guarantee: A reversal has occurred on this transaction due to
				 * your customer triggering a money-back guarantee. '
				 * buyer-complaint: A reversal has occurred on this transaction
				 * due to a complaint about the transaction from your customer.
				 * ' refund: A reversal has occurred on this transaction because
				 * you have given the customer a refund. ' other: A reversal has
				 * occurred on this transaction due to a reason not listed
				 * above.
				 */

				String reasonCode = nvp.get("PAYMENTINFO_0_REASONCODE").toString();

				// Add javascript to close Digital Goods frame. You may want to
				// add more javascript code to
				// display some info message indicating status of purchase in
				// the parent window
				response.setContentType("text/html");
				response.getWriter()
						.println(
								"<script>\n alert(\"Payment Successful\");\n// add relevant message above or remove the line if not required \n window.onload = function(){\nif(window.opener){\nwindow.close();\n}\nelse{\nif(top.dg.isOpen() == true){\ntop.dg.closeFlow();\nreturn true;\n}\n}\n};\n</script>");

			} else {
				// Display a user friendly Error on the page using any of the
				// following error information returned by PayPal

				String ErrorCode = nvp.get("L_ERRORCODE0").toString();
				String ErrorShortMsg = nvp.get("L_SHORTMESSAGE0").toString();
				String ErrorLongMsg = nvp.get("L_LONGMESSAGE0").toString();
				String ErrorSeverityCode = nvp.get("L_SEVERITYCODE0")
						.toString();

				response.getWriter()
						.println(
								"<script>\n alert(\"Payment Failed\");\n// add relevant message above or remove the line if not required \n window.onload = function(){\nif(window.opener){\nwindow.close();\n}\nelse{\nif(top.dg.isOpen() == true){\ntop.dg.closeFlow();\nreturn true;\n}\n}\n};\n</script>");
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}