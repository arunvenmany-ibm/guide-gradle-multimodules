// tag::copyright[]
/*******************************************************************************
 * Copyright (c) 2017, 2021 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License 2.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *******************************************************************************/
// end::copyright[]
package io.openliberty.guides.multimodules.lib;

import io.openliberty.guides.multimodules.web.HeightsBean;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class HeightsBeanTest {

    HeightsBean heightsBean=new HeightsBean();

    @Test
    // tag::testGetFeet[]
    public void testGetFeet() throws Exception {
        heightsBean.setHeightCm(String.valueOf(160));
        heightsBean.setHeightFeet("0");
        assertEquals("5", heightsBean.getHeightFeet());
    }

}
