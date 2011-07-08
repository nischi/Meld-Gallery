<!DOCTYPE beans PUBLIC "-//SPRING//DTD BEAN//EN" "http://www.springframework.org/dtd/spring-beans.dtd">

<beans default-autowire="byName">

	<bean id="localmmResourceBundle" class="[plugin]com.meldsolutions.utility.mmResourceBundle.mmResourceBundle">
		<constructor-arg name="applicationKey"><value>${applicationKey}</value></constructor-arg>
		<constructor-arg name="pluginFileRoot"><value>${subsystemFileRoot}</value></constructor-arg>
		<constructor-arg name="rblocale"><value>${rblocale}</value></constructor-arg>
	</bean>
	
</beans>