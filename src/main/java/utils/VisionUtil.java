package utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.ColorInfo;
import com.google.cloud.vision.v1.DominantColorsAnnotation;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.protobuf.ByteString;

public class VisionUtil {
	public static Image getImage(String filePath) throws Exception {
		Image image;
		ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));
		image = Image.newBuilder().setContent(imgBytes).build();

		return image;
	}

	public static void detectText(String filePath) throws Exception {
		List<AnnotateImageRequest> requests = new ArrayList<AnnotateImageRequest>();

		Image image = getImage(filePath);

		Feature feature = Feature.newBuilder().setType(Feature.Type.TEXT_DETECTION).build();
		AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feature).setImage(image).build();
		requests.add(request);

		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();

			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					System.out.println("Error: " + res.getError().getMessage());
					return;
				}

				// For full list of available annotations, see http://g.co/cloud/vision/docs
				for (EntityAnnotation annotation : res.getTextAnnotationsList()) {
					System.out.println("Text: " + annotation.getDescription());
					System.out.println("Position : " + annotation.getBoundingPoly());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static String detectDominantColor(String filePath) throws Exception, IOException {
		List<AnnotateImageRequest> requests = new ArrayList<AnnotateImageRequest>();
		ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));
		
		ColorUtil colorUtil = new ColorUtil();
		
		double max1st = 0.0;
		double max2nd = 0.0;
		String max1stColor ="";
		String max2ndColor ="";
		
		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Type.IMAGE_PROPERTIES).build();
		AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(request);

		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();

			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					System.out.printf("Error: %s\n", res.getError().getMessage());
					return "";
				}

				// For full list of available annotations, see http://g.co/cloud/vision/docs
				DominantColorsAnnotation colors = res.getImagePropertiesAnnotation().getDominantColors();
				for (ColorInfo color : colors.getColorsList()) {
					if (color.getPixelFraction() > max1st) {
						max2nd = max1st;
						max2ndColor = max1stColor;
						
						max1st = color.getPixelFraction();
						max1stColor = colorUtil.getColorNameFromRgb((int)color.getColor().getRed(), 
									                                (int)color.getColor().getGreen(), 
									                                (int)color.getColor().getBlue());
					} else if(color.getPixelFraction() > max2nd) {
						max2nd =  color.getPixelFraction();
						max2ndColor = colorUtil.getColorNameFromRgb((int)color.getColor().getRed(), 
									                                (int)color.getColor().getGreen(), 
									                                (int)color.getColor().getBlue());
					}
					// fraction : 해당 color가 차지하는 비중 (%)
//					System.out.printf("fraction: %f\nr: %f, g: %f, b: %f\n", color.getPixelFraction(),
//							color.getColor().getRed(), color.getColor().getGreen(), color.getColor().getBlue());
					
//					System.out.printf("fraction: %f\nr: %s\n", color.getPixelFraction()*100, colorUtil.getColorNameFromRgb(
//							(int)color.getColor().getRed(), (int)color.getColor().getGreen(), (int)color.getColor().getBlue()));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return max2ndColor;
	}
}