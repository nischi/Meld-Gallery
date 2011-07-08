<!DOCTYPE beans PUBLIC "-//SPRING//DTD BEAN//EN" "http://www.springframework.org/dtd/spring-beans.dtd">

<beans default-autowire="byName">

	<!-- Mura -->
	<bean id="MuraDisplayObjectManager" class="[plugin]com.meldsolutions.mura.MuraDisplayObjectManager">
	</bean>
	
	<bean id="MuraEventHandlerManager" class="[plugin]com.meldsolutions.mura.MuraEventHandlerManager">
	</bean>
	
	<bean id="MuraManager" class="[plugin]com.meldsolutions.mura.MuraManager">
	</bean>

	<!-- Utility -->
	<bean id="mmBreadCrumbs" class="[plugin]com.meldsolutions.utility.mmBreadCrumbs.mmBreadCrumbs">
	</bean>

	<bean id="mmFormTools" class="[plugin]com.meldsolutions.utility.mmFormTools.mmFormTools">
	</bean>

	<bean id="mmFileUpload" class="[plugin]com.meldsolutions.utility.mmFileUpload.mmFileUpload">
		<constructor-arg name="fileDirectory"><value>${fileDirectory}</value></constructor-arg>
	</bean>

	<bean id="mmImageRenderer" class="[plugin]com.meldsolutions.utility.mmImageRenderer.mmImageRenderer">
	</bean>

	<bean id="mmErrorManager" class="[plugin]com.meldsolutions.utility.mmError.mmErrorManager">
	</bean>

	<bean id="generalUtility" class="[plugin]com.meldsolutions.utility.general.generalUtility">
	</bean>

	<bean id="mmResourceBundle" class="[plugin]com.meldsolutions.utility.mmResourceBundle.mmResourceBundle">
		<constructor-arg name="applicationKey"><value>${applicationKey}</value></constructor-arg>
		<constructor-arg name="pluginFileRoot"><value>${pluginFileRoot}</value></constructor-arg>
		<constructor-arg name="rblocale"><value>${rblocale}</value></constructor-arg>
	</bean>
	
	<!-- remote -->
 	<bean id="MeldGalleryRemote" class="[plugin]com.meldsolutions.MeldGallery.remote.MeldGalleryRemote" />
	<bean id="MeldGalleryRemoteAOP" class="coldspring.aop.framework.RemoteFactoryBean" lazy-init="false">
		<property name="target">
			<ref bean="MeldGalleryRemote" />
		</property>
		<property name="serviceName">
			<value>MeldGalleryRemoteAOP</value>
		</property>
		<property name="relativePath">
			<value>|plugin|com/meldsolutions/MeldGallery/remote</value>
		</property>
		<property name="remoteMethodNames">
			<value>getImageList,getImageGroupList,getImageGrid,saveImageGroup,getDisplayList,getSelectTable,getDisplayTypeList,getFeedList</value>
		</property>
		<property name="beanFactoryName">
			<value>MeldGalleryBeanFactory</value>
		</property>
	</bean>

	<!-- application -->
	
	<!-- Meld -->
	<bean id="MeldGalleryManager" class="[plugin]com.meldsolutions.MeldGallery.application.MeldGalleryManager">
	</bean>

	<bean id="MeldGalleryFeedManager" class="[plugin]com.meldsolutions.MeldGallery.application.MeldGalleryFeedManager">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
		<constructor-arg name="dsnusername"><value>${dsnusername}</value></constructor-arg>
		<constructor-arg name="dsnpassword"><value>${dsnpassword}</value></constructor-arg>
		<constructor-arg name="dsnprefix"><value>${dsnprefix}</value></constructor-arg>
		<constructor-arg name="dsntype"><value>${dsntype}</value></constructor-arg>
	</bean>

	<bean id="MeldGalleryGalleryManager" class="[plugin]com.meldsolutions.MeldGallery.application.MeldGalleryGalleryManager">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
		<constructor-arg name="dsnusername"><value>${dsnusername}</value></constructor-arg>
		<constructor-arg name="dsnpassword"><value>${dsnpassword}</value></constructor-arg>
		<constructor-arg name="dsnprefix"><value>${dsnprefix}</value></constructor-arg>
		<constructor-arg name="dsntype"><value>${dsntype}</value></constructor-arg>
	</bean>

	<bean id="DisplayDAO" class="[plugin]com.meldsolutions.MeldGallery.core.display.DisplayDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
		<constructor-arg name="dsnusername"><value>${dsnusername}</value></constructor-arg>
		<constructor-arg name="dsnpassword"><value>${dsnpassword}</value></constructor-arg>
		<constructor-arg name="dsnprefix"><value>${dsnprefix}</value></constructor-arg>
		<constructor-arg name="dsntype"><value>${dsntype}</value></constructor-arg>
	</bean>
	<bean id="DisplayGateway" class="[plugin]com.meldsolutions.MeldGallery.core.display.DisplayGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
		<constructor-arg name="dsnusername"><value>${dsnusername}</value></constructor-arg>
		<constructor-arg name="dsnpassword"><value>${dsnpassword}</value></constructor-arg>
		<constructor-arg name="dsnprefix"><value>${dsnprefix}</value></constructor-arg>
		<constructor-arg name="dsntype"><value>${dsntype}</value></constructor-arg>
	</bean>
	<bean id="DisplayService" class="[plugin]com.meldsolutions.MeldGallery.core.display.DisplayService">
		<constructor-arg name="DisplayDAO">
			<ref bean="DisplayDAO"/>
		</constructor-arg>
		<constructor-arg name="DisplayGateway">
			<ref bean="DisplayGateway"/>
		</constructor-arg>
	</bean>

	<bean id="DisplayimageDAO" class="[plugin]com.meldsolutions.MeldGallery.core.displayimage.DisplayimageDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
		<constructor-arg name="dsnusername"><value>${dsnusername}</value></constructor-arg>
		<constructor-arg name="dsnpassword"><value>${dsnpassword}</value></constructor-arg>
		<constructor-arg name="dsnprefix"><value>${dsnprefix}</value></constructor-arg>
		<constructor-arg name="dsntype"><value>${dsntype}</value></constructor-arg>
	</bean>
	<bean id="DisplayimageGateway" class="[plugin]com.meldsolutions.MeldGallery.core.displayimage.DisplayimageGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
		<constructor-arg name="dsnusername"><value>${dsnusername}</value></constructor-arg>
		<constructor-arg name="dsnpassword"><value>${dsnpassword}</value></constructor-arg>
		<constructor-arg name="dsnprefix"><value>${dsnprefix}</value></constructor-arg>
		<constructor-arg name="dsntype"><value>${dsntype}</value></constructor-arg>
	</bean>
	<bean id="DisplayimageService" class="[plugin]com.meldsolutions.MeldGallery.core.displayimage.DisplayimageService">
		<constructor-arg name="DisplayimageDAO">
			<ref bean="DisplayimageDAO"/>
		</constructor-arg>
		<constructor-arg name="DisplayimageGateway">
			<ref bean="DisplayimageGateway"/>
		</constructor-arg>
	</bean>	

	<bean id="DisplaytypeDAO" class="[plugin]com.meldsolutions.MeldGallery.core.displaytype.DisplaytypeDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
		<constructor-arg name="dsnusername"><value>${dsnusername}</value></constructor-arg>
		<constructor-arg name="dsnpassword"><value>${dsnpassword}</value></constructor-arg>
		<constructor-arg name="dsnprefix"><value>${dsnprefix}</value></constructor-arg>
		<constructor-arg name="dsntype"><value>${dsntype}</value></constructor-arg>
	</bean>
	<bean id="DisplaytypeGateway" class="[plugin]com.meldsolutions.MeldGallery.core.displaytype.DisplaytypeGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
		<constructor-arg name="dsnusername"><value>${dsnusername}</value></constructor-arg>
		<constructor-arg name="dsnpassword"><value>${dsnpassword}</value></constructor-arg>
		<constructor-arg name="dsnprefix"><value>${dsnprefix}</value></constructor-arg>
		<constructor-arg name="dsntype"><value>${dsntype}</value></constructor-arg>
	</bean>
	<bean id="DisplaytypeService" class="[plugin]com.meldsolutions.MeldGallery.core.displaytype.DisplaytypeService">
		<constructor-arg name="DisplaytypeDAO">
			<ref bean="DisplaytypeDAO"/>
		</constructor-arg>
		<constructor-arg name="DisplaytypeGateway">
			<ref bean="DisplaytypeGateway"/>
		</constructor-arg>
	</bean>
	
	<bean id="ImageDAO" class="[plugin]com.meldsolutions.MeldGallery.core.image.ImageDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
		<constructor-arg name="dsnusername"><value>${dsnusername}</value></constructor-arg>
		<constructor-arg name="dsnpassword"><value>${dsnpassword}</value></constructor-arg>
		<constructor-arg name="dsnprefix"><value>${dsnprefix}</value></constructor-arg>
		<constructor-arg name="dsntype"><value>${dsntype}</value></constructor-arg>
	</bean>
	<bean id="ImageGateway" class="[plugin]com.meldsolutions.MeldGallery.core.image.ImageGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
		<constructor-arg name="dsnusername"><value>${dsnusername}</value></constructor-arg>
		<constructor-arg name="dsnpassword"><value>${dsnpassword}</value></constructor-arg>
		<constructor-arg name="dsnprefix"><value>${dsnprefix}</value></constructor-arg>
		<constructor-arg name="dsntype"><value>${dsntype}</value></constructor-arg>
	</bean>
	<bean id="ImageService" class="[plugin]com.meldsolutions.MeldGallery.core.image.ImageService">
		<constructor-arg name="ImageDAO">
			<ref bean="ImageDAO"/>
		</constructor-arg>
		<constructor-arg name="ImageGateway">
			<ref bean="ImageGateway"/>
		</constructor-arg>
	</bean>
	
	<bean id="ImagegroupDAO" class="[plugin]com.meldsolutions.MeldGallery.core.imagegroup.ImagegroupDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
		<constructor-arg name="dsnusername"><value>${dsnusername}</value></constructor-arg>
		<constructor-arg name="dsnpassword"><value>${dsnpassword}</value></constructor-arg>
		<constructor-arg name="dsnprefix"><value>${dsnprefix}</value></constructor-arg>
		<constructor-arg name="dsntype"><value>${dsntype}</value></constructor-arg>
	</bean>
	<bean id="ImagegroupGateway" class="[plugin]com.meldsolutions.MeldGallery.core.imagegroup.ImagegroupGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
		<constructor-arg name="dsnusername"><value>${dsnusername}</value></constructor-arg>
		<constructor-arg name="dsnpassword"><value>${dsnpassword}</value></constructor-arg>
		<constructor-arg name="dsnprefix"><value>${dsnprefix}</value></constructor-arg>
		<constructor-arg name="dsntype"><value>${dsntype}</value></constructor-arg>
	</bean>
	<bean id="ImagegroupService" class="[plugin]com.meldsolutions.MeldGallery.core.imagegroup.ImagegroupService">
		<constructor-arg name="ImagegroupDAO">
			<ref bean="ImagegroupDAO"/>
		</constructor-arg>
		<constructor-arg name="ImagegroupGateway">
			<ref bean="ImagegroupGateway"/>
		</constructor-arg>
	</bean>
	
	<bean id="ImagegroupimageDAO" class="[plugin]com.meldsolutions.MeldGallery.core.imagegroupimage.ImagegroupimageDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
		<constructor-arg name="dsnusername"><value>${dsnusername}</value></constructor-arg>
		<constructor-arg name="dsnpassword"><value>${dsnpassword}</value></constructor-arg>
		<constructor-arg name="dsnprefix"><value>${dsnprefix}</value></constructor-arg>
		<constructor-arg name="dsntype"><value>${dsntype}</value></constructor-arg>
	</bean>
	<bean id="ImagegroupimageGateway" class="[plugin]com.meldsolutions.MeldGallery.core.imagegroupimage.ImagegroupimageGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
		<constructor-arg name="dsnusername"><value>${dsnusername}</value></constructor-arg>
		<constructor-arg name="dsnpassword"><value>${dsnpassword}</value></constructor-arg>
		<constructor-arg name="dsnprefix"><value>${dsnprefix}</value></constructor-arg>
		<constructor-arg name="dsntype"><value>${dsntype}</value></constructor-arg>
	</bean>
	<bean id="ImagegroupimageService" class="[plugin]com.meldsolutions.MeldGallery.core.imagegroupimage.ImagegroupimageService">
		<constructor-arg name="ImagegroupimageDAO">
			<ref bean="ImagegroupimageDAO"/>
		</constructor-arg>
		<constructor-arg name="ImagegroupimageGateway">
			<ref bean="ImagegroupimageGateway"/>
		</constructor-arg>
	</bean>
	
	<bean id="SettingDAO" class="[plugin]com.meldsolutions.MeldGallery.core.setting.SettingDAO">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
		<constructor-arg name="dsnusername"><value>${dsnusername}</value></constructor-arg>
		<constructor-arg name="dsnpassword"><value>${dsnpassword}</value></constructor-arg>
		<constructor-arg name="dsnprefix"><value>${dsnprefix}</value></constructor-arg>
		<constructor-arg name="dsntype"><value>${dsntype}</value></constructor-arg>
	</bean>
	<bean id="SettingGateway" class="[plugin]com.meldsolutions.MeldGallery.core.setting.SettingGateway">
		<constructor-arg name="dsn"><value>${dsn}</value></constructor-arg>
		<constructor-arg name="dsnusername"><value>${dsnusername}</value></constructor-arg>
		<constructor-arg name="dsnpassword"><value>${dsnpassword}</value></constructor-arg>
		<constructor-arg name="dsnprefix"><value>${dsnprefix}</value></constructor-arg>
		<constructor-arg name="dsntype"><value>${dsntype}</value></constructor-arg>
	</bean>
	<bean id="SettingService" class="[plugin]com.meldsolutions.MeldGallery.core.setting.SettingService">
		<constructor-arg name="SettingDAO">
			<ref bean="SettingDAO"/>
		</constructor-arg>
		<constructor-arg name="SettingGateway">
			<ref bean="SettingGateway"/>
		</constructor-arg>
	</bean>
</beans>