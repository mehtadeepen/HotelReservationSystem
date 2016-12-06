package apimanager;

import java.util.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;






import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import beans.HotelInfo;

public class WebServiceClient {

	public List<HotelInfo> hotellist(String destination, String arrivalDate, String departureDate) {


		String urlstr = "https://api.eancdn.com/ean-services/rs/hotel/v3/list?"
				+ "_type=json&cid=55505"
				+ "&minorRev=28"
				+ "&apiKey=3w6yv6js2x5xz59ttbqeatrg"
				+ "&locale=en_US&currencyCode=USD"
				+ "&destinationString="+destination
				+ "&arrivalDate="+arrivalDate
				+ "&departureDate="+departureDate;

		System.out.println(urlstr);

		try
		{
			URL url = new URL(urlstr);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			InputStream stream = connection.getInputStream();
			InputStreamReader reader = new InputStreamReader(stream);
			BufferedReader buffer = new BufferedReader(reader);
			String line;


			String json = "";
			while((line = buffer.readLine()) != null) {
				json += line;
			}


			JSONParser parser = new JSONParser();
			try {
				JSONObject root = (JSONObject) parser.parse(json);
				JSONObject data = (JSONObject) root.get("HotelListResponse");
				JSONObject HotelList = (JSONObject) data.get("HotelList");
				JSONArray HotelSummary  = (JSONArray) HotelList.get("HotelSummary");

				System.out.println(HotelSummary.size());

				List<HotelInfo> hotels = new LinkedList<HotelInfo>();

				for(int i=0;i<HotelSummary.size();i++)
				{
					JSONObject hotelSummary = (JSONObject) HotelSummary.get(i);

					HotelInfo hotel = new HotelInfo();

					hotel.setHotelID(String.valueOf((long)hotelSummary.get("hotelId")));
					hotel.setCity((String) hotelSummary.get("city"));
					hotel.setAddress((String) hotelSummary.get("address1"));
					hotel.setCurrency((String) hotelSummary.get("rateCurrencyCode"));
					hotel.setHighrate(String.valueOf(hotelSummary.get("highRate")));
					hotel.setLowRate(String.valueOf(hotelSummary.get("lowRate")));
					hotel.setName((String) hotelSummary.get("name"));
					hotel.setShortDesc(String.valueOf(hotelSummary.get("shortDescription")).replace("&lt;p&gt;&lt;b&gt;Property Location&lt;/b&gt; &lt;br /&gt;", ""));
				//	System.out.println(hotel.getShortDesc());
					hotel.setThumbnailURL((String) hotelSummary.get("thumbNailUrl"));
					hotel.setHotelRating(String.valueOf(hotelSummary.get("hotelRating")));
					hotel.setArrivalDate(arrivalDate);
					hotel.setDepartureDate(departureDate);
					hotels.add(hotel);

					



				}
				System.out.println(hotels.size());
				return hotels;


			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}



		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;

	}


	public HotelInfo getHotelInfomation(String HotelID){

		String urlstr = "https://api.eancdn.com/ean-services/rs/hotel/v3/info?_type=json"
				+ "&cid=55505"
				+ "&minorRev=28"
				+ "&apiKey=3w6yv6js2x5xz59ttbqeatrg"
				+ "&locale=en_US"
				+ "&currencyCode=USD"
				+ "&hotelId="+HotelID;

		System.out.println(urlstr);

		try
		{
			URL url = new URL(urlstr);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			InputStream stream = connection.getInputStream();
			InputStreamReader reader = new InputStreamReader(stream);
			BufferedReader buffer = new BufferedReader(reader);
			String line;


			String json = "";
			while((line = buffer.readLine()) != null) {
				json += line;
			}


			JSONParser parser = new JSONParser();
			try {
				JSONObject root = (JSONObject) parser.parse(json);
				JSONObject data = (JSONObject) root.get("HotelInformationResponse");
				JSONObject hotelSummary = (JSONObject) data.get("HotelSummary");
				JSONObject hotelDetails = (JSONObject) data.get("HotelDetails");
				JSONObject hotelImages = (JSONObject) data.get("HotelImages");
				JSONArray images = (JSONArray)hotelImages.get("HotelImage");

				HotelInfo hotel = new HotelInfo();

				hotel.setHotelID(String.valueOf((long)hotelSummary.get("hotelId")));
				hotel.setCity((String) hotelSummary.get("city"));
				hotel.setAddress((String) hotelSummary.get("address1"));
				hotel.setCurrency((String) hotelSummary.get("rateCurrencyCode"));
				hotel.setHighrate(String.valueOf(hotelSummary.get("highRate")));
				hotel.setLowRate(String.valueOf(hotelSummary.get("lowRate")));
				hotel.setName((String) hotelSummary.get("name"));
				hotel.setShortDesc(String.valueOf(hotelSummary.get("shortDescription")).replace("&lt;p&gt;&lt;b&gt;Property Location&lt;/b&gt; &lt;br /&gt;", ""));
				
				hotel.setHotelRating(String.valueOf(hotelSummary.get("hotelRating")));
				hotel.setStateProvinceCode(String.valueOf(hotelSummary.get("stateProvinceCode")));
				hotel.setPostalCode(String.valueOf(hotelSummary.get("postalCode")));
				hotel.setCountryCode(String.valueOf(hotelSummary.get("countryCode")));
				hotel.setCheckinTime(String.valueOf(hotelDetails.get("checkInTime")));
				hotel.setCheckoutTime(String.valueOf(hotelDetails.get("checkOutTime")));
				hotel.setRoomDetailDesc(String.valueOf(hotelDetails.get("roomInformation")));
				hotel.setPropertyDesc(String.valueOf(hotelDetails.get("propertyDescription")));
				
				System.out.println(images.size());

				List<String> imgs = new LinkedList<String>();

				for(int i=0;i<images.size();i++)
				{
					JSONObject HotelImage = (JSONObject) images.get(i);
					imgs.add(String.valueOf(HotelImage.get("url")));
					
					
				}

				hotel.setImagesURL(imgs);

				System.out.println(hotel.getImagesURL().size());





				return hotel;


			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}



		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		return null;


	}


	public static void main(String[] args) {
		WebServiceClient client = new WebServiceClient();
		//client.hotellist("London","12/25/2014","12/28/2014");
		client.getHotelInfomation("122212");

	}
}