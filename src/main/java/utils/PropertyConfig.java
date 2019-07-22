package utils;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.ClassPathResource;

@Configuration
//@PropertySource("classpath:/api.properties")
public class PropertyConfig {
	@Bean
	public static PropertySourcesPlaceholderConfigurer properties() {
		PropertySourcesPlaceholderConfigurer configurer = 
				new PropertySourcesPlaceholderConfigurer();
		configurer.setLocations(
				new ClassPathResource("api.properties"));
		return configurer;
	}
}
